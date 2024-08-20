part of 'login_out_cubit.dart';

sealed class LoginOutState extends Equatable {
  const LoginOutState();

  @override
  List<Object> get props => [];
}

final class LoginOutInitial extends LoginOutState {}

final class LoginOutLoading extends LoginOutState {}

final class LoginOutSuccess extends LoginOutState {}

final class LoginOutFailure extends LoginOutState {
  final String error;

  const LoginOutFailure({required this.error});

  @override
  List<Object> get props => [error];
}
