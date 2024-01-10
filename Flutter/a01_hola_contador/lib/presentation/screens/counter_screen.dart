import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: const Text('Counter Screen'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade100,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$contador', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
            Text( contador == 1 ? 'Click' : 'Clicks'  , style: const TextStyle(fontSize: 30),),

            // if ( contador == 1 ) const Text('click', style:  TextStyle(fontSize: 30)), 
            // if ( contador != 1 ) const Text('clicks', style:  TextStyle(fontSize: 30))
            
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.plus_one),
        onPressed: (){
          contador++;
          setState(() {});
        }
        ),
    );
  }
}