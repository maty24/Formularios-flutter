import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //para poder usar solo en este widget el bloc cubit
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CounterCubitView(),
    );
  }
}

class _CounterCubitView extends StatelessWidget {
  const _CounterCubitView();

  void incrementBy(BuildContext context, [int value = 1]){
     context.read<CounterCubit>().increaseBy(value);
  }
  @override
  Widget build(BuildContext context) {
    //poder escuchar los cambios del estate, le pongo watch para que escuchar el countercubit
    final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        //para escuchar el state de mi cubit
        title: Text('Cubit Counter: ${counterState.transactionCounter}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => {
              //estoy llamndo los metodos dle cubit
              context.read<CounterCubit>().reset()
            },
          )
        ],
      ),
      body: Center(
        //le pongo blocbuilder porque solo este widget va a cambiar el estado
        child: BlocBuilder<CounterCubit, CounterState>(
          //solo se ejecuta cuando  cuando el current sea diferente del previous
          buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+1'),
            onPressed: () => {
               incrementBy(context)
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => {
              incrementBy(context,2)
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () => {
               incrementBy(context,3)
            },
          ),
        ],
      ),
    );
  }
}
