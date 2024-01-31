import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  int _contador = 0;

  int get counter => _contador;

  void increment(){
    _contador++;
    //notifyListeners();
  }

  void resetear(){
    _contador=0;
    notifyListeners();
  }
}