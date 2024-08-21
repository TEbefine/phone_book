part of 'update_photo_cubit.dart';

sealed class UpdatePhotoState extends Equatable {
  const UpdatePhotoState();

  @override
  List<Object> get props => [];
}

final class UpdatePhotoInitial extends UpdatePhotoState {}

final class UpdatePhotoLoading extends UpdatePhotoState {}

final class UpdatePhotoSuccess extends UpdatePhotoState {}

final class UpdatePhotoFailure extends UpdatePhotoState {
  final String error;

  const UpdatePhotoFailure({required this.error});

  @override
  List<Object> get props => [error];
}
