import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:phone_book/function/authentication.dart';

part 'update_photo_state.dart';

class UpdatePhotoCubit extends Cubit<UpdatePhotoState> {
  UpdatePhotoCubit() : super(UpdatePhotoInitial());

  Future<void> pickAndCropImage(BuildContext context) async {
    emit(UpdatePhotoLoading());

    try {
      final pickedFile =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (pickedFile != null && pickedFile.files.isNotEmpty) {
        final file = pickedFile.files.first;
        final fileExtension = file.extension?.toLowerCase();
        if (!['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
          emit(const UpdatePhotoFailure(
              error: "Please select a valid Image file"));
          return;
        }

        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.xFiles.first.path,
          uiSettings: [
            WebUiSettings(
              context: context,
            ),
          ],
        );

        if (croppedFile != null) {
          changeUserProfilePicture(croppedFile);
        } else {
          emit(const UpdatePhotoFailure(error: "Cropping was canceled"));
          return;
        }
      } else {
        emit(const UpdatePhotoFailure(error: "No image selected"));
        return;
      }
    } catch (e) {
      emit(const UpdatePhotoFailure(error: 'some thing happen'));
    }
  }

  Future<void> changeUserProfilePicture(CroppedFile pickFile) async {
    final userId = UserRepository.instance.user?.uid ?? '';

    Uint8List imageBytes = await pickFile.readAsBytes();
    String? downloadUrl = await uploadProfilePicture(imageBytes, userId);
    if (downloadUrl != null) {
      try {
        await UserRepository.instance.updateProfilePicture(downloadUrl);
        emit(UpdatePhotoSuccess());
      } catch (e) {
        emit(UpdatePhotoFailure(error: e.toString()));
      }
    }
  }

  Future<String?> uploadProfilePicture(
      Uint8List fileBytes, String userId) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('$userId.jpeg');
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      await storageRef.putData(fileBytes, metadata);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      emit(UpdatePhotoFailure(error: e.toString()));
      return null;
    }
  }
}
