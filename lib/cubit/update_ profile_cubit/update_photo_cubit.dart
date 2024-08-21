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

    final pickFile = await FilePicker.platform.pickFiles();
    if (pickFile != null) {
      final fileBytes = pickFile.files.first.bytes;
      final userId = UserRepository.instance.user?.uid ?? '';

      String? downloadUrl = await uploadProfilePicture(fileBytes!, userId);
      if (downloadUrl != null) {
        try {
          await UserRepository.instance.updateProfilePicture(downloadUrl);
          emit(UpdatePhotoSuccess());
        } catch (e) {
          emit(UpdatePhotoFailure(error: e.toString()));
        }
      }
    } else {
      emit(const UpdatePhotoFailure(error: "Please select a file"));
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
