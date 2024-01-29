import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
   
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
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
                onChanged: (value) {
                  setState(() {
                    print( value );
                  });
                  
                },
              ),

            ],
          ),
        ),
      )
    );
  }
}