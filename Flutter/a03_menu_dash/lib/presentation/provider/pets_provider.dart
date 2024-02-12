import 'package:flutter/material.dart';
import 'package:menu_dash/entities/model/pets_model.dart';
import 'package:http/http.dart' as http;

class PetsProvider extends ChangeNotifier {
  
  static const String apiEndPoint = 'https://jatinderji.github.io/users_pets_api/users_pets.json';

  bool isLoading = true;
  String error = '';
  PetsResponse pets = PetsResponse(data: []);

  // Método para obtener los datos del API
  getDataFromAPI() async {

    try {
      final response = await http.get(Uri.parse(apiEndPoint));
      if ( response.statusCode == 200 ){
        pets = petsResponseFromJson(response.body);
        isLoading = false;
        notifyListeners();
      } else {
        error = 'Error: ${response.statusCode}';
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      error = 'Error $e';
      isLoading = false;
      notifyListeners();
    }
    
  }

}