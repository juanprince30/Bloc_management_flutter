import 'package:bloc_management/bloc/counter_bloc.dart';
import 'package:bloc_management/counterpagebloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //les provider ce mette ici, dans notre cas on a qu'un seul provider qui est CounterBloc
    return MultiBlocProvider(
      providers: [
        //On appelle Blocprovider pour qu'il cree counter bloc 
        BlocProvider(create: (context)=> CounterBloc()),
      ], 
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        "/": (context)=> const CounterPageBloc(),
        },
    );
  }
}