import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/provider/qr_provider.dart';
import 'package:menu_dash/presentation/screens/sub_screens/qr_pages/direcciones_widget.dart';
import 'package:menu_dash/presentation/screens/sub_screens/qr_pages/mapa_widget.dart';
import 'package:provider/provider.dart';

class QRScreen extends StatelessWidget {
   
  const QRScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //final currentIndex = 1;
    final menuOptProvider = Provider.of<QRProvider>(context);
    final currentIndex = menuOptProvider.selectedMenuOpt;

    return Scaffold(
      appBar: AppBar(title: const Text('Historial'),),
      body: _HomeWidget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ( i ) => menuOptProvider.selectedMenuOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa'),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Direcciones'),
        ]
        ),
      floatingActionButton: const FloatingActionButton(
          elevation: 0,
          onPressed: null,
          child: Icon(Icons.filter_center_focus),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _HomeWidget extends StatelessWidget {
  const _HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final menuOptProvider = Provider.of<QRProvider>(context);
    final _currentIndex = menuOptProvider.selectedMenuOpt;

    switch (_currentIndex) {
      case 0:
        return MapaWidget();
      case 1:
        return DireccionesWidget();
      default:
        return MapaWidget();
    }
  }
}