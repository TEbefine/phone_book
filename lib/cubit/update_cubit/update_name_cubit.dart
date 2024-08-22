import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/function/authentication.dart';

part 'update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  UpdateNameCubit(this.router) : super(UpdateNameInitial());

  final GoRouter router;

  Future<void> updateName(String newName) async {
    emit(UpdateNameLoading());
    if (newName.isEmpty) {
      emit(const UpdateNameFailure(error: "Please enter your name."));
      return;
    }

    try {
      await UserRepository.instance.changeUserName(newName);
      emit(const UpdateNameSuccess(success: 'User name updated successfully!'));
      router.go('/profile');
    } catch (e) {
      emit(UpdateNameFailure(error: e.toString()));
    }
  }
}
