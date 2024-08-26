part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final String userId;

  const AuthAuthenticated({required this.userId});

  @override
  List<Object> get props => [userId];
}

final class AuthUnauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  const AuthError({required this.error});

  @override
  List<Object> get props => [error];
}
