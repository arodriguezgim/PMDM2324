import 'package:flutter/material.dart';
import 'package:sharedpre/pages/home_screen.dart';
import 'package:sharedpre/pages/settings_screen.dart';
import 'package:sharedpre/share_preferences/preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferencias.init();
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
      theme: Preferencias.isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
