import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_book/function/authentication.dart';
import 'package:phone_book/router/router.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit() : super(RegisterUserInitial());

  Future<void> registerUser(
      String email, String password, String checkPassword) async {
    emit(RegisterUserLoading());

    if (password != checkPassword) {
      emit(const RegisterUserFailure(error: "Password don't correct."));
      return;
    }

    try {
      await UserRepository.instance.registerUser(email, password);
      emit(RegisterUserSuccess());
      router.go('/profile');
    } catch (e) {
      final match = RegExp(r'\[(.*?)\]\s*(.*)').firstMatch(e.toString());
      if (match != null && match.groupCount == 2) {
        emit(RegisterUserFailure(error: match.group(2) ?? 'Unknown error'));
        return;
      }
      emit(RegisterUserFailure(error: e.toString()));
    }
  }
}
