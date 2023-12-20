void main(){
  
  
  final Map<String, dynamic> rawJson = {
    
    'nombre'  : 'Spiderman',
    'poder'   : 'Subir por las paredes',
    //'estaVivo': true,
  };
  
  final spiderman = Heroe.fromJson( rawJson );
  
  /*
  final batman = Heroe(
    estaVivo: true,
    nombre: 'Batman',
    poder: 'Dinero'
  );
  */
  
  
  print( spiderman );
  
}

class Heroe{
  
  String nombre;
  String poder;
  bool   estaVivo;
  
  Heroe({
    required this.nombre,
    required this.poder,
    required this.estaVivo,
  });
  
  Heroe.fromJson( Map<String,dynamic> json )
    : nombre   = json['nombre'] ?? 'Sin Nombre',
      poder    = json['poder'] ?? 'Sin Poder',
      estaVivo = json['estaVivo'] ?? true; 
  
  
  @override
  String toString(){
    return '$nombre, $poder, Está vivo: ${ estaVivo  ? 'SI' : 'NO' }';
  }
}