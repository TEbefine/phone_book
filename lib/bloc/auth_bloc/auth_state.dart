part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

  bool get isAuthenticated => this is AuthAuthenticated;

  bool get isInitial => this is AuthInitial;
}

final class AuthInitial extends AuthState {
  // static AuthState fromUser(User? user) {
  //   if (user != null) {
  //     return AuthAuthenticated(user: user);
  //   }
  //   return AuthUnauthenticated();
  // }
}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthUnauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String? emailError;
  final String? passwordError;

  const AuthError({this.emailError, this.passwordError});

  @override
  List<Object> get props => [emailError ?? '', passwordError ?? ''];
}

final class LoginError extends AuthState {
  final String error;

  const LoginError({required this.error});

  @override
  List<Object> get props => [error];
}
