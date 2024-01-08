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
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$contador', style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
            const Text('clicks', style: TextStyle(fontSize: 30),),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.plus_one),
        onPressed: (){
          contador++;

        }
        ),
    );
  }
}