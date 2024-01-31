import 'package:flutter/material.dart';
import 'package:menu_dash/config/theme/app_theme.dart';
import 'package:menu_dash/presentation/provider/counter_provider.dart';
import 'package:menu_dash/presentation/screens.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    //Aqui es donde ponemos el Provider
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MainApp(),
      )
  );
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
        'provider': (context) =>  ProviderScreen(),
        'pantalla4': (context) => const ComponentesScreen(),
        'pantalla5': (context) => const ComponentesScreen(),
        'pantalla6': (context) => const ComponentesScreen(),
        'pantalla7': (context) => const ComponentesScreen(),
        'pantalla8': (context) => const ComponentesScreen(),
      },
    );
  }
}
