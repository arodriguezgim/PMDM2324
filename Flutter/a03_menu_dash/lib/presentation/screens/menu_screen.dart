import 'package:flutter/material.dart';
import 'package:menu_dash/config/theme/app_theme.dart';
import 'package:menu_dash/presentation/widgets/menu/menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<OpcionMenuItem> _listaOpcionesMenu = [
      OpcionMenuItem(
        color: AppTheme.colorList[0],
        icono: Icons.settings_input_component,
        texto: 'Componentes',
        screenName: 'componentes',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[1],
        icono: Icons.stadium,
        texto: 'Provider',
        screenName: 'provider',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[2],
        icono: Icons.sports_basketball,
        texto: 'Marcador Basket',
        screenName: 'basket',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[3],
        icono: Icons.ac_unit,
        texto: 'Opción 4',
        screenName: 'pantalla4',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[4],
        icono: Icons.ac_unit,
        texto: 'Opción 5',
        screenName: 'pantalla5',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[5],
        icono: Icons.ac_unit,
        texto: 'Opción 6',
        screenName: 'pantalla6',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[6],
        icono: Icons.ac_unit,
        texto: 'Opción 7',
        screenName: 'pantalla7',
      ),
      OpcionMenuItem(
        color: AppTheme.colorList[7],
        icono: Icons.ac_unit,
        texto: 'Opción 8',
        screenName: 'pantalla8',
      ),
    ];

    return Scaffold(
      // Appbar con texto MEnu
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: _listaOpcionesMenu.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final OpcionMenuItem _opcion = _listaOpcionesMenu[index];

              return MenuItem(
                color: _opcion.color,
                icono: _opcion.icono,
                texto: _opcion.texto,
                screenName: _opcion.screenName,
              );
            }),
      ),
    );
  }
}

class OpcionMenuItem {
  final Color color;
  final IconData icono;
  final String texto;
  final String screenName;
  const OpcionMenuItem({
    required this.color,
    required this.icono,
    required this.texto,
    required this.screenName,
  });
}
