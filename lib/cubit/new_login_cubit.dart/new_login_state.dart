part of 'new_login_cubit.dart';

sealed class NewLoginState extends Equatable {
  const NewLoginState();

  @override
  List<Object> get props => [];
}

final class SignIn extends NewLoginState {}

final class SignUp extends NewLoginState {}
