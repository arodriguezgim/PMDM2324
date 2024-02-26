import 'package:firechomon/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authProvider = Provider.of<AuthProvider>(context);



    return Scaffold(
      appBar: AppBar(title: const Text('Registro'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration( labelText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration( labelText: 'Password'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Aqui nos REGISTRAMOS en Firebase
            }, 
            child: Text('Registro de Usuario')
            ),
          ElevatedButton(
            onPressed: () {
              // Vamos a la pantalla de Registro
              Navigator.pop(context);
            }, 
            child: Text('Ir a Login')
            ),
        ],
      ),
    );
  }
}