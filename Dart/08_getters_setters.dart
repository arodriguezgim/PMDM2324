void main(){
  
  final miCuadrado = Cuadrado( lado: -5.0);
  
  
  //miCuadrado.lado = 5.0;
  //miCuadrado.lado = -6;
  
  
  print( 'Area: ${ miCuadrado.area }');
}

class Cuadrado{
  
  double _lado; 
  
  Cuadrado({ required double lado }) 
    : assert( lado > 0 , 'lado debe ser > 0' ), 
    //assert( lado > 100),
      _lado = lado;
  
  double get area {
    return _lado * _lado;
  } 
  
  set lado( double valor ){
    print('Establecemos el nuevo lado a: $valor');
    if( valor < 0 ) throw 'El valor ha de ser mayor que 0';
    _lado = valor;
  }
  
  
  
  
  double calcularArea(){
    return _lado * _lado;
  }
}