part of 'counter_bloc.dart';

//que tipos de eventos va a recivir el bloc

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

//no necesito ningun argumento
class CounterReset extends CounterEvent {}
