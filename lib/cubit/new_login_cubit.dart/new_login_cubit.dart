import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_login_state.dart';

class NewLoginCubit extends Cubit<NewLoginState> {
  NewLoginCubit() : super(SignUp());

  void showSignUp() => emit(SignUp());
  void showSignIn() => emit(SignIn());
}
