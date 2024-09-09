import 'package:bloc/bloc.dart';

//l'evenenment est ce que l'on jete dans le puit
//on doit pas pourvoir y acceder directement faut acceder au element qui l'etentendent voila pk il est abstract
abstract class CounterEvent{}

//est l'evenement qui increment
class IncrementCounterEvent extends CounterEvent{

}

//est l'evenement qui decremente
class DecrementCounterEvent extends CounterEvent{

}

//Est l'etat a la sortie apres le traitement de l'evenement recu
//on doit pas aussi il acceder directement 
class CounterState{
  final int counter;

  CounterState({required this.counter});
}

//ce etat est en cas de succes de l'evenement envoye
class CounterSuccessState extends CounterState{
  CounterSuccessState({required super.counter});

}

//ce etat est en cas d'echecs de l'evenement envoyer
class CounterErrorState extends CounterState{
  final String errorMessage;
  CounterErrorState( {required this.errorMessage, required super.counter});

}

class AddValueCounterEvent extends CounterEvent{
  final int value;

  AddValueCounterEvent({required this.value});
}

//c'est l'etat initial auquel on initialise l'application
class InitialState extends CounterState{
  InitialState():super(counter:0);
  
}

//la fonction Bloc de base pour le traitement de l'event et l'emision du State
class CounterBloc extends Bloc<CounterEvent, CounterState>{
  //on initialise en meme temps le traitement dans le constructeur de la variable
  CounterBloc():super(InitialState()){
    //on signifie on recoit un event avec le la fonction preciser puis on emet
    //l'emet a la sortie depends de la configuration que l'on fait 
    on((IncrementCounterEvent event, emit){
      if (state.counter < 10){
        emit(CounterSuccessState(counter: state.counter+1));
      }
      else{
        String errorIncrement= "Vous ne Pouvez plus incrementer";
        emit(CounterErrorState(errorMessage: errorIncrement, counter: state.counter));
      }
    });
    on((DecrementCounterEvent event, emit){
      if(state.counter> 0){
        emit(CounterSuccessState(counter: state.counter-1));
      }
      else{
        String errorDecrement= "Vous ne Pouvez plus decrementer";
        emit(CounterErrorState(errorMessage: errorDecrement, counter: state.counter));
      }
    });
    on((AddValueCounterEvent event, emit){
      if(state.counter< 10 - event.value){
        emit(CounterSuccessState(counter: state.counter+ event.value));
      }
      else{
        String errorDecrement= "Vous ne Pouvez plus decrementer";
        emit(CounterErrorState(errorMessage: errorDecrement, counter: state.counter));
      }
    });
  }
  
}