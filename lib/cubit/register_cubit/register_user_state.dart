part of 'register_user_cubit.dart';

sealed class RegisterUserState extends Equatable {
  const RegisterUserState();

  @override
  List<Object> get props => [];
}

final class RegisterUserInitial extends RegisterUserState {}

final class RegisterUserLoading extends RegisterUserState {}

final class RegisterUserSuccess extends RegisterUserState {}

final class RegisterUserFailure extends RegisterUserState {
  final String error;

  const RegisterUserFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class DeleteUserLoading extends RegisterUserState {}

final class DeleteUserSuccess extends RegisterUserState {}

final class DeleteUserFailure extends RegisterUserState {
  final String error;

  const DeleteUserFailure({required this.error});

  @override
  List<Object> get props => [error];
}
