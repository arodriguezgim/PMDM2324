import 'package:flutter/material.dart';

class QRScreen extends StatelessWidget {
   
  const QRScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial'),),
      body: const Center(
         child: Text('QRScreen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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