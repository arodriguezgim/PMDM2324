import 'package:a02_componentes/config/theme/app_theme.dart';
import 'package:a02_componentes/presentation/screens/listview1_screen.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ListView1Screen(),
      theme: AppTheme( colorSeleccionado: 3 ).getTheme(),
    );
  }
}