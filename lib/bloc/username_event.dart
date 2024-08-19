part of 'username_bloc.dart';

sealed class UsernameEvent extends Equatable {
  const UsernameEvent();

  @override
  List<Object> get props => [];
}

class ChangeUsernameEvent extends UsernameEvent {
  final String newName;

  const ChangeUsernameEvent({required this.newName});

  @override
  List<Object> get props => [newName];
}
