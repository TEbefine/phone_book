import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/router/router.dart';

part 'login_out_state.dart';

class LoginOutCubit extends Cubit<LoginOutState> {
  LoginOutCubit() : super(LoginOutInitial());

  Future<void> signOut() async {
    emit(LoginOutLoading());

    await UserRepository.instance.signOut();

    emit(LoginOutSuccess());

    router.go('/login');
  }
}
