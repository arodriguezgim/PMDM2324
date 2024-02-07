import 'package:flutter/material.dart';

class QRProvider extends ChangeNotifier {

  int _selectedMenuOpt = 1;

  int get selectedMenuOpt => _selectedMenuOpt;

  set selectedMenuOpt(int i){
    _selectedMenuOpt = i;
    notifyListeners();
  }
  
}