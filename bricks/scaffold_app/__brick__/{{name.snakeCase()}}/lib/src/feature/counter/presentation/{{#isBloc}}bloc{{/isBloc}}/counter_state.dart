sealed class CounterState {
  final int counter;
  const CounterState({required this.counter});
}

final class InitialState extends CounterState {
  const InitialState({required int counter}) : super(counter: counter);
}
