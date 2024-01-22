import 'package:a02_componentes/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class Card2Screen extends StatelessWidget {
   
  const Card2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Otras tarjetas'),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: const [
          CardPersonalizada1(),


        ],
      )
    );
  }
}

