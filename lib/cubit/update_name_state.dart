part of 'update_name_cubit.dart';

sealed class UpdateNameState extends Equatable {
  const UpdateNameState();

  @override
  List<Object> get props => [];
}

final class UpdateNameInitial extends UpdateNameState {}

final class UpdateNameLoading extends UpdateNameState {}

final class UpdateNameSuccess extends UpdateNameState {
  final String newName;

  const UpdateNameSuccess({required this.newName});

  @override
  List<Object> get props => [newName];
}

final class UpdateNameFailure extends UpdateNameState {
  final String error;

  const UpdateNameFailure({required this.error});

  @override
  List<Object> get props => [error];
}
