import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_event.dart';
part 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  UsernameBloc() : super(UsernameInitial()) {
    on<UsernameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
