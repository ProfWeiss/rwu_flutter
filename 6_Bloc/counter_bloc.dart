import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

// Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) => emit(CounterState(state.value + 1)));
    on<DecrementEvent>((event, emit) => emit(CounterState(state.value - 1)));
  }
}
