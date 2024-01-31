import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class Pagina2Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text( context.watch<CounterProvider>().counter.toString() , style: TextStyle(fontSize: 50),),
      );
  }
}