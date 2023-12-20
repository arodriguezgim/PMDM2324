void main(){
  
  final Heroe superman = Heroe(poder: 'Volar', nombre: 'Superman',  );
  
  print( superman );
  
  //print( superman.nombre);
  //print( superman.poder);
  
  print( superman.toString());
  
  
}


class Heroe {
  
  String nombre;
  String poder;
  /*
  Heroe( String pNombre, String ppoder ) 
    : nombre = pNombre,
      poder = ppoder;
  */  
  
  Heroe({
    required this.nombre,
    this.poder = 'Sin poder',
  });
  
  @override
  String toString(){
    return '$nombre - $poder';
  }
 
  
}