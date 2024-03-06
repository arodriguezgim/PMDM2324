import 'package:flutter/material.dart';
import 'package:sharedpre/pages/home_screen.dart';
import 'package:sharedpre/pages/settings_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences',
      initialRoute: '/',
      routes: {
        '/' :(context) => HomeScreen(),
        'settings' :(context) => SettingsScreen()
      },
    );
  }
}
