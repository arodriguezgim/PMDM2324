import 'package:flutter/material.dart';
import 'package:sharedpreferences/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(),
        scaffoldBackgroundColor: const Color.fromARGB(255, 156, 204, 101),
        unselectedWidgetColor: Colors.deepPurple.shade300,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
