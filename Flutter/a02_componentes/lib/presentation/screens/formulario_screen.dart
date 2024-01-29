import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
   
  const FormularioScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const FlutterLogo(size: 150,),
              TextFormField(
                autofocus: true,
                //initialValue: 'Alberto',
                textCapitalization: TextCapitalization.words,
              ),

            ],
          ),
        ),
      )
    );
  }
}