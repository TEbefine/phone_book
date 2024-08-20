import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit() : super(RegisterUserInitial());
}
