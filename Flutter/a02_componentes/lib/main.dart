import 'package:a02_componentes/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:a02_componentes/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
      theme: AppTheme().getTheme(),
    );
  }
}