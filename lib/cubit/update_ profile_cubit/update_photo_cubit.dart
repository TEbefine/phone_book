import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:phone_book/function/authentication.dart';

part 'update_photo_state.dart';

class UpdatePhotoCubit extends Cubit<UpdatePhotoState> {
  UpdatePhotoCubit() : super(UpdatePhotoInitial());

  Future<void> changeUserProfilePicture() async {
    emit(UpdatePhotoLoading());

    final pickFile = await FilePicker.platform.pickFiles(type: FileType.image);

    if (pickFile != null && pickFile.files.isNotEmpty) {
      final file = pickFile.files.first;
      final userId = UserRepository.instance.user?.uid ?? '';

      final fileExtension = file.extension?.toLowerCase();
      if (fileExtension != 'jpg' &&
          fileExtension != 'jpeg' &&
          fileExtension != 'png' &&
          fileExtension != 'gif') {
        emit(const UpdatePhotoFailure(
            error: "Please select a valid Image file"));
        return;
      }

      String? downloadUrl = await uploadProfilePicture(file.bytes!, userId);
      if (downloadUrl != null) {
        try {
          await UserRepository.instance.updateProfilePicture(downloadUrl);
          emit(UpdatePhotoSuccess());
        } catch (e) {
          emit(UpdatePhotoFailure(error: e.toString()));
        }
      }
    } else {
      emit(const UpdatePhotoFailure(error: "Please select image a file"));
      return;
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
