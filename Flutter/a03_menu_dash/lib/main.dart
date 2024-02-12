import 'package:flutter/material.dart';
import 'package:menu_dash/config/theme/app_theme.dart';
import 'package:menu_dash/presentation/provider/counter_provider.dart';
import 'package:menu_dash/presentation/provider/pets_provider.dart';
import 'package:menu_dash/presentation/provider/qr_provider.dart';
import 'package:menu_dash/presentation/provider/scan_provider.dart';
import 'package:menu_dash/presentation/screens.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    //Aqui es donde ponemos el Provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => QRProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
        ChangeNotifierProvider(create: (_) => PetsProvider()),
      ] ,
      child: const MainApp(),       
    ),
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
        'qr': (context) => const QRScreen(),
        'perretes': (context) => const PetsScreen(),
        'ubicacion': (context) => const UbicacionScreen(),
        'pantalla7': (context) => const ComponentesScreen(),
        'pantalla8': (context) => const ComponentesScreen(),
      },
    );
  }
}
