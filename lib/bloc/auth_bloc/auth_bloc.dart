import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_book/function/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLogoutRequested>(_onSignedOut);
    add(AuthCheckRequested());
  }

  Future<void> _onLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    String? emailError;
    String? passwordError;

    bool isEmail(String email) {
      final emailRegExp = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        caseSensitive: false,
      );
      return emailRegExp.hasMatch(email);
    }

    if (event.email == null || event.email!.isEmpty) {
      emailError = 'Email required';
    } else if (!isEmail(event.email!)) {
      emailError = 'Invalid email';
    }

    if (event.password == null || event.password!.isEmpty) {
      passwordError = 'Password required';
    }

    if (emailError != null || passwordError != null) {
      emit(AuthError(emailError: emailError, passwordError: passwordError));
      return;
    }

    try {
      User user =
          await userRepository.signInUser(event.email!, event.password!);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    final user = userRepository.user;

    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onSignedOut(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await userRepository.signOut();
    print('Ok');
    emit(AuthUnauthenticated());
  }
}
