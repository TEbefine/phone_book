import 'package:bloc/bloc.dart';

class UsernameControllerCubit extends Cubit<String> {
  UsernameControllerCubit() : super('');

  void updateUsername(String username) {
    emit(username);
  }
}
