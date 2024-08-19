import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'profile_photo_state.dart';

class ProfilePhotoCubit extends Cubit<ProfilePhotoState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  ProfilePhotoCubit() : super(ProfilePhotoInitial());

  Future<void> updateProfilePhoto(String filePath) async {
    emit(ProfilePhotoLoading());

    try {
      final user = _auth.currentUser;
      if (user == null) {
        emit(const ProfilePhotoFailure("User not logged in"));
        return;
      }

      final file = File(filePath);
      final ref = _storage.ref().child('profile_photos/${user.uid}.jpg');
      await ref.putFile(file);

      final photoUrl = await ref.getDownloadURL();

      await user.updatePhotoURL(photoUrl);

      emit(ProfilePhotoSuccess(photoUrl));
    } catch (e) {
      emit(ProfilePhotoFailure(e.toString()));
    }
  }
}
