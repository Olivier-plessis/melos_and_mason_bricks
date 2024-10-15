import 'counter_event.dart';
import 'counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState(counter: 0)) {
    on<Increment>((event, emit) {
      emit(InitialState(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      if (state.counter > 0) emit(InitialState(counter: state.counter - 1));
    });
  }
}
