abstract class CounterStates{}

class CounterInitialState extends CounterStates{}

class CounterIncreaseState extends CounterStates{
  final int count;

  CounterIncreaseState(this.count);
}

class CounterDecreaseState extends CounterStates{
  final int count;

  CounterDecreaseState(this.count);
}