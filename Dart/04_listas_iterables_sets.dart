void main() {
  
  final numbers = [1,2,3,4,5,5,6,6,6,7,8,8,9,10];
  
  
  
  print('Lista original: $numbers');
  print( 'Tamaño: ${numbers.length}');
  print( 'Primer elemento: ${numbers.first}');
  print( 'Primer elemento: ${numbers[0]}');
  print( 'Modo Reverso: ${numbers.reversed}');
  
  
  final reversedNumbers = numbers.reversed;
  
  print('Iterable: $reversedNumbers');
  print('Lista: ${reversedNumbers.toList() }');
  print('Set: ${reversedNumbers.toSet() }');
  
  
  final numerosMasGrandesQue5 = numbers.where(
    ( int numero ) {
      return numero > 5;
    }
  );

  
  print(' >5: iterable: $numerosMasGrandesQue5');
  print(' >5: Set: ${numerosMasGrandesQue5.toSet()}');
}