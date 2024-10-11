sealed class CounterStates {
  final int counter;
  const CounterStates({required this.counter});
}

final class InitialState extends CounterStates {
  const InitialState({required int counter}) : super(counter: counter);
}
