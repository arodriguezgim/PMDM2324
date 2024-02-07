import 'package:flutter/material.dart';

class MapaWidget extends StatelessWidget {
  const MapaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ( _ , index) => ListTile(
        leading: Icon( Icons.map, color: Theme.of(context).primaryColor,),
        title: Text('MApa Widget'),
        subtitle: Text('$index'),
        trailing: Icon( Icons.keyboard_arrow_right_outlined, color: Theme.of(context).primaryColor,),
      ),
      );
  }
}