import 'package:flutter/material.dart';

class AlertasScreen extends StatelessWidget {
   
  const AlertasScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alertas y Snackbars'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                _mostrarAlerta( context );
              }, 
              child: const Text('Mostrar Alerta')
              ),
              const SizedBox(height: 20,),
              FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context);
              }, 
              child: const Text('Mostrar Copyright')
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _mostrarSnackBar( context ), 
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar')
        ),
    );
  }
  
  void _mostrarAlerta( BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        /*
        return CupertinoAlertDialog(
          title: const Text('Alerta DAM'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(size: 150,),
              Text('Eiusmod minim ad minim anim commodo Lorem velit mollit laborum amet minim aliquip. Qui voluptate sint consectetur in sit Lorem in quis amet culpa nisi dolor. Enim ex aliquip culpa adipisicing esse aliquip. Ullamco ipsum dolore ut consequat nostrud id in adipisicing ipsum voluptate incididunt laborum ex.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('Aceptar'),
              ),
              TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('Salir', style: TextStyle(color: Colors.redAccent),),
              ),
          ],
        );
        */
        
        return AlertDialog.adaptive(
          title: const Text('Alerta DAM'),
          elevation: 20,
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(size: 150,),
              Text('Eiusmod minim ad minim anim commodo Lorem velit mollit laborum amet minim aliquip. Qui voluptate sint consectetur in sit Lorem in quis amet culpa nisi dolor. Enim ex aliquip culpa adipisicing esse aliquip. Ullamco ipsum dolore ut consequat nostrud id in adipisicing ipsum voluptate incididunt laborum ex.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('Aceptar'),
              ),
              TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('Salir', style: TextStyle(color: Colors.redAccent),),
              ),
          ],
        );
        
      },
      );
      
  }
}

void _mostrarSnackBar(BuildContext context ) {

  //ScaffoldMessenger.of(context)
}