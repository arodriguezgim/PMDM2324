import 'package:flutter/material.dart';

class AppTheme {

  static const Color miColor = Color.fromARGB(255, 101, 116, 181);

  static const colorList = [
    miColor,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.deepOrange,
    Colors.orange,
    Colors.pink,
    Colors.pinkAccent
  ];

  final int colorSeleccionado;
  final bool isDarkMode;

  AppTheme({
    required this.colorSeleccionado,
    this.isDarkMode = false
    })
  :assert( colorSeleccionado >= 0, 'El color ha de ser un valor superior a 0'),
   assert( colorSeleccionado <= colorList.length, 'El color ha de estar comprendido en la lista');

  ThemeData getTheme() => ThemeData(
    useMaterial3: false,
    colorSchemeSeed: colorList[ colorSeleccionado ],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
  );
}