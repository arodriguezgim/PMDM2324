import 'package:flutter/material.dart';

class CounterFuncitionsScreen extends StatefulWidget {
  CounterFuncitionsScreen({super.key});

  @override
  State<CounterFuncitionsScreen> createState() => _CounterFuncitionsScreenState();
}

class _CounterFuncitionsScreenState extends State<CounterFuncitionsScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.access_alarm),
        //elevation: 10,
        title: const Text('Counter Functions Screen'),
        centerTitle: true,
        backgroundColor: Colors.pink.shade100,
        actions: const [
          //Icon(Icons.access_alarm),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.settings),
          )
        ],
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
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
            BotonPersonalizado(icono: Icons.refresh_rounded,),
            const SizedBox(height: 10),
            BotonPersonalizado(icono: Icons.exposure_minus_1_outlined,),
            const SizedBox(height: 10),
            BotonPersonalizado(icono: Icons.plus_one,),
        ],
      )
    );
  }
}

class BotonPersonalizado extends StatelessWidget {
  final IconData icono;
  const BotonPersonalizado({
    super.key, 
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon( icono ),
      onPressed: (){
        
      }
    );
  }
}