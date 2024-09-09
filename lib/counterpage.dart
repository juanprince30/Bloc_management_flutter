import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int countervalue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Counter Page", textDirection: TextDirection.ltr,),),
      ),
      body: Center(
        child: Text("Counter = ${countervalue}", style: const TextStyle(fontSize: 25),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            setState(() {
              countervalue--;
            });
          },
          child: const Icon(Icons.remove),),
          const SizedBox(width: 40,),
          FloatingActionButton(onPressed: (){
            setState(() {
              countervalue++;
            });
          },
          child: const Icon(Icons.add),)
        ],
      ),
    );
  }
}