part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInRequested extends AuthEvent {
  final String? email;
  final String? password;

  const AuthSignInRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email ?? '', password ?? ''];
}

class AuthSignUpRequested extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}

class AuthCheckRequested extends AuthEvent {}
