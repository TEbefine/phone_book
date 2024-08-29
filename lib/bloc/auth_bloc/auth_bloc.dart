import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_book/function/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<AuthSignInRequested>(_onLoginRequested);
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLogoutRequested>(_onSignedOut);
    add(AuthCheckRequested());
  }

  Future<void> _onLoginRequested(
      AuthSignInRequested event, Emitter<AuthState> emit) async {
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

    emit(AuthLoading());

    try {
      User user =
          await userRepository.signInUser(event.email!, event.password!);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      final match = RegExp(r'\[(.*?)\]\s*(.*)').firstMatch(e.toString());
      if (match != null && match.groupCount == 2) {
        emit(LoginError(error: match.group(2) ?? 'Unknown error'));
        return;
      }
      emit(LoginError(error: e.toString()));
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
    emit(AuthLoading());
    try {
      await UserRepository.instance.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(const AuthError());
    }
  }
}
