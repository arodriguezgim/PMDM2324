import 'package:a02_componentes/config/theme/app_theme.dart';
import 'package:a02_componentes/presentation/screens/screens.dart';

import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomeScreen(),
      theme: AppTheme( colorSeleccionado: 6 ).getTheme(),
      //initialRoute: '/',
      routes: {
        '/':(context) => const HomeScreen(),
        'lista1':(context) => ListView1Screen(),
        'lista2':(context) => ListView2Screen(),
        'botones':(context) => ButtonsScreen(),
        'card':(context) => CardScreen(),
      },
    );
  }
}