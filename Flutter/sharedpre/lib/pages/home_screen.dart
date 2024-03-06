import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'settings');
          }, icon: const Icon(Icons.settings))
        ],
        ),
      body: const Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode: False'),
            Divider(),
            Text('Nombre: Alberto'),
            Divider(),
            Text('Género: Masculino'),
            
          ],
         )
      ),
    );
  }
}