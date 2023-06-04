import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';



class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));

  //metodos que emiten estados

  void increaseBy(int value) {
    //emit para modificar
    emit(state.copyWith(
        counter: state.counter + value,
        transactionCounter: state.transactionCounter + 1));
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
