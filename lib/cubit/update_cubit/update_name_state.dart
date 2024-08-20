part of 'update_name_cubit.dart';

sealed class UpdateNameState extends Equatable {
  const UpdateNameState();

  @override
  List<Object> get props => [];
}

final class UpdateNameInitial extends UpdateNameState {}

final class UpdateNameLoading extends UpdateNameState {}

final class UpdateNameSuccess extends UpdateNameState {}

final class UpdateNameFailure extends UpdateNameState {
  final String error;

  const UpdateNameFailure({required this.error});

  @override
  List<Object> get props => [error];
}
