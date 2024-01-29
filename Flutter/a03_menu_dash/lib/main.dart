import 'package:flutter/material.dart';
import 'package:menu_dash/config/theme/app_theme.dart';
import 'package:menu_dash/presentation/screens.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(colorSeleccionado: 0).getTheme(),
      routes: {
        '/': (context) => const MenuScreen(),
        'componentes': (context) => const ComponentesScreen(),
        'basket': (context) => const BasketScreen(),
        'pantalla3': (context) => const ComponentesScreen(),
        'pantalla4': (context) => const ComponentesScreen(),
        'pantalla5': (context) => const ComponentesScreen(),
        'pantalla6': (context) => const ComponentesScreen(),
        'pantalla7': (context) => const ComponentesScreen(),
        'pantalla8': (context) => const ComponentesScreen(),
      },
    );
  }
}
