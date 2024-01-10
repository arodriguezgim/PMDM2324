void main() {
  
  emitirNumeros().listen( (value){
    print('Stream valor: $value');
  });
  

  
}

Stream<int> emitirNumeros() {
  
  return Stream.periodic( const Duration(seconds:1), (value){
    //print('desde periodic $value');
    return value;
  }).take(5);
}
