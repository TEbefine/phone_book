import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_photo_state.dart';

class ProfilePhotoCubit extends Cubit<ProfilePhotoState> {
  ProfilePhotoCubit() : super(ProfilePhotoInitial());
}
