import 'package:flutter/material.dart';

class AppTheme {
  static const colorList = [
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

  AppTheme({required this.colorSeleccionado, this.isDarkMode = false})
      : assert(
            colorSeleccionado >= 0, 'El color ha de ser un valor superior a 0'),
        assert(colorSeleccionado <= colorList.length,
            'El color ha de estar comprendido en la lista');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[colorSeleccionado],
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade200,
        ),
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );
}
