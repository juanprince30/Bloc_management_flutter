import 'package:bloc_management/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPageBloc extends StatelessWidget {
  const CounterPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Counter Page", textDirection: TextDirection.ltr,),),
      ),
      body: Center(
        //ici la partie BlocBuilder fait un listen (Souscrit) vers CounterBloc et attent un CounterState
        child: BlocBuilder<CounterBloc, CounterState>(
          //si un state sort apres avoir fait appelle a counterBloc, la methode Builder s'execute
          builder: (context, state){
            if (state is CounterSuccessState || state is InitialState){
              return Center(
                child: Text("Counter = ${state.counter}", style: const TextStyle(fontSize: 25),),
              );
            }
            else if (state is CounterErrorState){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Counter = ${state.counter}", style: const TextStyle( fontSize: 25,color: Colors.red),),
                  ),
                  Center(
                    child: Text("${state.errorMessage}", style: const TextStyle( fontSize: 25,color: Colors.red),),
                  ),
                ],
              );
            }
            else{
              return Container();
            }
          },
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            //voici comment envoyer l'evenement decremente counter
            context.read<CounterBloc>().add(DecrementCounterEvent());
          },
          child: const Icon(Icons.remove),),
          const SizedBox(width: 40,),
          FloatingActionButton(onPressed: (){
            //voici comment envoyer l'evenement incremente counter
            context.read<CounterBloc>().add(IncrementCounterEvent());
          },
          child: const Icon(Icons.add),),
          const SizedBox(width: 40,),
          FloatingActionButton(onPressed: (){
            //voici comment envoyer l'evenement incremente counter
            context.read<CounterBloc>().add(AddValueCounterEvent(value: 4));
          },
          child: const Icon(Icons.access_alarm),)
        ],
      ),
    );
  }
}