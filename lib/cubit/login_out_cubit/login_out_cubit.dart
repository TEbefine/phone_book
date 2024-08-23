import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_book/function/authentication.dart';

part 'login_out_state.dart';

class LoginOutCubit extends Cubit<LoginOutState> {
  LoginOutCubit() : super(LoginOutInitial());

  Future<void> signOut() async {
    emit(LoginOutLoading());
    try {
      await UserRepository.instance.signOut();
    } catch (e) {
      emit(LoginOutFailure(error: e.toString()));
    }

    emit(LoginOutSuccess());
  }
}
