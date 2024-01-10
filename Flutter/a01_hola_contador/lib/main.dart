//import 'package:a01_hola_contador/presentation/screens/counter_screen.dart';
import 'package:a01_hola_contador/presentation/screens/counter_screen_functions.dart';
import 'package:flutter/material.dart';

void main(){
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: CounterFuncitionsScreen()
    );
  }
}

