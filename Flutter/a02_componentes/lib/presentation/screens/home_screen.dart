import 'package:a02_componentes/presentation/screens/listview1_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),),
      body: Center(
              child: Column(
                children: [
                  FilledButton(
                    child: const Text('Cambiar a ListView1'),
                    onPressed: (){
                       Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ListView1Screen(),
                          ),
                        );
                      }, 
                      
                   ),


                   FilledButton(
                    child: const Text('Cambiar a ListView 2 por nombre'),
                    onPressed: (){
                       Navigator.pushNamed(context, 'lista2');
                      },    
                   ),
                 ],
             ),
         
      ),
    );
  }
}