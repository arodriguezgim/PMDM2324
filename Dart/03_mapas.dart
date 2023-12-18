void main() {
  
    final Map<String, dynamic> pokemon = {
      'nombre' : 'Pikachu',
      'hp'     : 100,
      'isAlive': true,
      'abilities' : <String>['rayo'],
      'sprites': {
        1: 'pikachu/front.png',
        2: 'pikachu/back.png',
      },
           
    };
  
  
  
  
  print(pokemon);
  
  print('Nombre: ${ pokemon[ 'nombre' ] }');
  print('Nombre: ${ pokemon[ 'abilities' ] }');
  print('Nombre: ${ pokemon[ 'sprites' ] }');
  
  print('Front: ${ pokemon['sprites'][1] }');
  print('Back: ${ pokemon['sprites'][2] }');
}