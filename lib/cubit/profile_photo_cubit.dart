import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

part 'profile_photo_state.dart';

class ProfilePhotoCubit extends Cubit<ProfilePhotoState> {
  ProfilePhotoCubit() : super(ProfilePhotoInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickAndCropImage() async {
    emit(ProfilePhotoLoading());
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      final picker = ImagePickerPlugin();
      if (picker == null) {
        emit(const ProfilePhotoFailure("No image selected"));
        return;
      }

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );

      if (croppedFile != null) {
        // Update photo in Firebase
        // await FirebaseAuth.instance.currentUser.updatePhotoURL(croppedFile.path);
        emit(ProfilePhotoSuccess(croppedFile.path));
      } else {
        emit(const ProfilePhotoFailure("Failed to crop image"));
      }
    } catch (e) {
      emit(ProfilePhotoFailure(e.toString()));
    }
  }
}
