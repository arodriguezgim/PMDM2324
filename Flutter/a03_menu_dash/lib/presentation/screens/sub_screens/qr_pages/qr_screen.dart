import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/screens/sub_screens/qr_pages/mapa_widget.dart';

class QRScreen extends StatelessWidget {
   
  const QRScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final _currentIndex = 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Historial'),),
      body: MapaWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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