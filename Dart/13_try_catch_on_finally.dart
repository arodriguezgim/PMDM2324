void main() async {
  
  print('Inicio del programa');
  
  try {
    final value = await httpGet('https://miapi.com');
    print (value);
  }
  on Exception catch(err){
    print('Tenemos una excepcion: $err');
  }
  catch (err){
    print('Error: $err');
  } 
  finally {
    print('Fin del try y del catch');
  }
  
  
  print('Fin del programa');
}

  Future<String> httpGet ( String url ) async {
  
        await Future.delayed( const Duration(seconds: 1) );
        throw Exception('No tenemos parametros en la URL');
        //return 'Peticion realizada correctamente';
}