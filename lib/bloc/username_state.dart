part of 'username_bloc.dart';

sealed class UsernameState extends Equatable {
  const UsernameState();
  
  @override
  List<Object> get props => [];
}

final class UsernameInitial extends UsernameState {}
