import 'package:flutter/material.dart';

const tarjetas = <Map<String,dynamic>>[
  { 'elevation': 0.0,  'label': 'Elevation 0'},
  { 'elevation': 1.0,  'label': 'Elevation 1'},
  { 'elevation': 2.0,  'label': 'Elevation 2'},
  { 'elevation': 3.0,  'label': 'Elevation 3'},
  { 'elevation': 4.0,  'label': 'Elevation 4'},
  { 'elevation': 5.0,  'label': 'Elevation 6'},
];




class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarjetas - Cards'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            ...tarjetas.map(( tarjeta ) => TarjetaPersonalizada1(label: tarjeta['label'], elevation: tarjeta['elevation'])),

            ...tarjetas.map(( tarjeta ) => TarjetaPersonalizada2(label: tarjeta['label'], elevation: tarjeta['elevation'])),

            ...tarjetas.map(( tarjeta ) => TarjetaPersonalizada3(label: tarjeta['label'], elevation: tarjeta['elevation'])),
            
            const SizedBox(height: 60,)
          ],
        ),
      )
    );
  }
}


class TarjetaPersonalizada1 extends StatelessWidget {

  final String label;
  final double elevation;
  const TarjetaPersonalizada1({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text( label ),
            )
          ],
        ),
        ),
    );
  }
}

class TarjetaPersonalizada2 extends StatelessWidget {

  final String label;
  final double elevation;
  const TarjetaPersonalizada2({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all( Radius.circular(10)),
        side:BorderSide(
          color: Colors.black
        ) 
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text( '$label - Outline' ),
            )
          ],
        ),
        ),
    );
  }
}


class TarjetaPersonalizada3 extends StatelessWidget {

  final String label;
  final double elevation;
  const TarjetaPersonalizada3({super.key, required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {

    final colores = Theme.of(context).colorScheme;

    return Card(
      color: colores.primary,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.more_vert_outlined)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text( '$label - Filled' ),
            )
          ],
        ),
        ),
    );
  }
}