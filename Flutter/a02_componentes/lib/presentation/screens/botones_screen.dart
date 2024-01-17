import 'package:a02_componentes/presentation/screens/listview1_screen.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
   
  const ButtonsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final colores = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Botones Screen'),),
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
                   const Divider(),
                  ElevatedButton(onPressed: () {
                    
                  }, child: const Text('Elevated Button')),
                  const ElevatedButton(onPressed: null, child: Text('Elevated Button')),

                  Wrap(
                    children: [
                      ElevatedButton.icon(
                        onPressed: (){}, 
                        icon: const Icon(Icons.access_alarm_outlined), 
                        label: const Text('Elevated Icon'),
                        ),

                        FilledButton(onPressed: () {
                          
                        }, child: const Text('Filled Button')),
                        FilledButton.icon(
                          onPressed: () {
                            
                          }, 
                          icon: const Icon(Icons.ac_unit_sharp), 
                          label: const Text('Filled Icon'),),
                        OutlinedButton(onPressed: () {
                          
                        }, child: const Text('Outlined Button'),),
                        OutlinedButton.icon(onPressed: () {
                          
                        }, icon: Icon(Icons.outbond_outlined), label: const Text('Outloned Icon'),),
                        IconButton(onPressed:() {
                          
                        }, icon: Icon(Icons.ac_unit_outlined)),
                        
                        IconButton(
                          onPressed:() {}, 
                          icon: const Icon(Icons.ac_unit_outlined),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(colores.primary),
                            iconColor: const MaterialStatePropertyAll(Colors.white),
                          ),
                          )
                    
                    ],
                  ),
                  const Divider(),
                  // Nos creamos un Boton Personalizado.
                  BotonPersonalizado()










                 ],
             ),
         
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios),
        onPressed:(){
          Navigator.pop(context);
        } ),
    );
  }
}

class BotonPersonalizado extends StatelessWidget {
  const BotonPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    
    
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: colores.primary,
          child: InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Material Button', style: TextStyle(color: Colors.white),),
              ),
          ),
              ),
        );
  }
}