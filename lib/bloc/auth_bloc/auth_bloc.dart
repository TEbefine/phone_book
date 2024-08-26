import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      on<AuthLoginRequested>(_onLoginRequested);
      on<AuthLogoutRequested>(_onLogoutRequested);
      on<AuthCheckRequested>(_onCheckRequested);
    });
  }

  void _onLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const AuthAuthenticated(userId: '12345'));
    } catch (e) {
      emit(const AuthError(error: 'Login failed'));
    }
  }

  void _onLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(const AuthError(error: 'Logout failed'));
    }
  }

  void _onCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    final isAuthenticated =
        await _checkIfAuthenticated(); // Replace with actual authentication check

    if (isAuthenticated) {
      emit(const AuthAuthenticated(userId: '12345'));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<bool> _checkIfAuthenticated() async {
    await Future.delayed(const Duration(seconds: 1));

    return false;
  }
}
