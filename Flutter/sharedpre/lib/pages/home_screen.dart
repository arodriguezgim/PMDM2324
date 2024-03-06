import 'package:flutter/material.dart';
import 'package:sharedpre/share_preferences/preferencias.dart';

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
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode: ${Preferencias.isDarkMode}'),
            const Divider(),
            Text('Nombre: ${Preferencias.name}'),
            const Divider(),
            Text('Género: ${Preferencias.genero}'),
            
          ],
         )
      ),
    );
  }
}