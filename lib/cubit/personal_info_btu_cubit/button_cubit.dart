import 'package:bloc/bloc.dart';

class ButtonCubit extends Cubit<bool> {
  ButtonCubit() : super(false);

  void checkButtonState(String value) {
    emit(value.isNotEmpty);
  }
}
