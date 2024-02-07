import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_dash/presentation/provider/qr_provider.dart';
import 'package:menu_dash/presentation/provider/scan_provider.dart';
import 'package:menu_dash/presentation/screens/sub_screens/qr_pages/direcciones_widget.dart';
import 'package:menu_dash/presentation/screens/sub_screens/qr_pages/mapa_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () async {

            try {
              // Abrimos el Bar Code Scanner
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                      '#3D8BEF', 
                                                      'Cancelar', 
                                                      false, 
                                                      ScanMode.QR);
              

              print(barcodeScanRes);
              if ( barcodeScanRes != "-1") {
                // Añadimos el QR a la lista de Direcciones del Provider
                final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.nuevoScan(barcodeScanRes);
              }
              

            } on PlatformException catch (e) {
              throw Exception(e);
            }
            
          },
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