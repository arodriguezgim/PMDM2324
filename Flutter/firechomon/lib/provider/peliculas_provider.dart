import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechomon/models/pelicula_model.dart';
import 'package:flutter/material.dart';

class PeliculasProvider  extends ChangeNotifier {

  List<Pelicula> _listaPeliculas = [];

  List<Pelicula> get obtenerPeliculas => _listaPeliculas;

  Future<void> obtenerListaPeliculas() async {

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('peliculas').get();
      _listaPeliculas = snapshot.docs.map((pelicula) => Pelicula.fromJson(pelicula.data())).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> anadirPelicula(Pelicula pelicula) async {
    try {
      await FirebaseFirestore.instance.collection('peliculas').add(pelicula.toJson());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  
}