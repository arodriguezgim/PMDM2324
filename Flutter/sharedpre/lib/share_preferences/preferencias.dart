import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {

  static late SharedPreferences _prefs;

  //Aqui me creo las propiedades globales que quiero manejar
  static String _name = '';
  static bool _isDarkMode = false;
  static int _genero = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //Getters y Setters para todos los valores
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String nombre){
    _name = nombre;
    _prefs.setString('name', nombre);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool isDarkMode){
    _isDarkMode = isDarkMode;
    _prefs.setBool('isDarkMode', isDarkMode);
  }



  static int get genero {
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int genero){
    _genero = genero;
    _prefs.setInt('genero', _genero);
  }
  
}