part of 'profile_photo_cubit.dart';

sealed class ProfilePhotoState extends Equatable {
  const ProfilePhotoState();

  @override
  List<Object> get props => [];
}

final class ProfilePhotoInitial extends ProfilePhotoState {}

final class ProfilePhotoLoading extends ProfilePhotoState {}

final class ProfilePhotoSuccess extends ProfilePhotoState {
  final String photoUrl;

  const ProfilePhotoSuccess(this.photoUrl);

  @override
  List<Object> get props => [photoUrl];
}

final class ProfilePhotoFailure extends ProfilePhotoState {
  final String error;

  const ProfilePhotoFailure(this.error);

  @override
  List<Object> get props => [error];
}
