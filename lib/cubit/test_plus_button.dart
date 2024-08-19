import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object?> get props => [count];
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0));

  void increment() => emit(CounterState(state.count + 1));
  void decrement() => emit(CounterState(state.count - 1));
}
