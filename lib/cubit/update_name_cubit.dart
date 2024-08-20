import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phone_book/function/authentication.dart';

part 'update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  UpdateNameCubit() : super(UpdateNameInitial());

  Future<void> updateName(String newName) async {
    emit(UpdateNameLoading());

    try {
      await UserRepository.instance.changeUserName(newName);
      emit(UpdateNameSuccess(newName: newName));
    } catch (e) {
      emit(UpdateNameFailure(error: e.toString()));
    }
  }
}
