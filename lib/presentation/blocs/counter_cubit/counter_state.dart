part of 'counter_cubit.dart';


//cuando el estado es igual no hace nada gracias a equatable comapara las instancias
class CounterState extends Equatable{
  final int counter;
  final int transactionCounter;

  const CounterState({
    this.counter = 0,
    this.transactionCounter = 0,
  });

  copyWith({
    int? counter,
    int? transactionCounter,
  }) =>CounterState(
    counter: counter ?? this.counter,
    transactionCounter: transactionCounter ?? this.transactionCounter
  );
  
  //esto es para comparar las instancias que hay
  @override
  List<Object> get props => [counter,transactionCounter];
}