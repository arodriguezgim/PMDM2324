import 'package:firechomon/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
         child: ElevatedButton(
            onPressed: () {
              // Salir de la sesion
              authProvider.signOut();
            }, 
            child: Text('Cerrar Sesión')
            ),
      ),
    );
  }
}