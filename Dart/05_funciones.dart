void main() {
  
  print( saludosATodos()  );
  
  print( sumarDosNumeros(10 , 2)  );
  
  print( sumarDosNumerosOpcional(10 )  );
}


String saludosATodos() =>  'Hola a todos!!!!';

int sumarDosNumeros(int a, int b) => a + b;

int sumarDosNumerosOpcional( int a, [int b = 7]){
  
  return a + b;
}