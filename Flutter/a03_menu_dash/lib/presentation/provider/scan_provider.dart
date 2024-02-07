import 'package:flutter/material.dart';
import 'package:menu_dash/entities/model/scan_model.dart';

class ScanListProvider  extends ChangeNotifier{

  // Por defecto nuestra lisa de scans estará vacía
  List<ScanModel> _listaScans = [];
  String tipoSeleccionado = 'http';

  nuevoScan( String valor){

    final nuevoScan = ScanModel(valor: valor);
    if ( tipoSeleccionado == 'http') {
      nuevoScan.tipo = 'http';
    }
    _listaScans.add(nuevoScan);
    notifyListeners();
  }
  
  // Obtenemos la lista de scans
  List<ScanModel> getScans(){
    List<ScanModel> scans = _listaScans;
    return scans;
  }

  borrarListaScans() {
    _listaScans = [];
    notifyListeners();
  }


}