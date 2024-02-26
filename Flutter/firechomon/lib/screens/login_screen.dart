
import 'package:firechomon/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
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
              // Aqui nos logueamos en Firebase
              authProvider.loginConEmailyPassword(emailController.text, passwordController.text);
            }, 
            child: Text('Logueo')
            ),
          ElevatedButton(
            onPressed: () {
              // Logueo con Google
              authProvider.signInWithGoogle();
            }, 
            child: Text('Loguearse con Google')
            ),
          ElevatedButton(
            onPressed: () {
              // Vamos a la pantalla de Registro
              Navigator.pushNamed(context, '/register');
            }, 
            child: Text('Ir a Registro de usuario')
            ),
        ],
      )
    );
  }
}