import 'package:flutter/material.dart';

class ProviderScreen extends StatelessWidget {
   
  const ProviderScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manejador Provider'),),
      body: Center(
         child: Text('ProviderScreen'),
      ),
      
    );
  }
}