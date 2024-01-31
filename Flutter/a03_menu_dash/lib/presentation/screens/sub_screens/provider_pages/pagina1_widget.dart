import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class Pagina1Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( context.watch<CounterProvider>().counter.toString()
                , style: TextStyle(fontSize: 50),),
          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().increment();
            }, child: const Text('Sumar'),),

          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().resetear();
            }, child: const Text('Resetear'),),
        ],
      ),
    );
  }
}