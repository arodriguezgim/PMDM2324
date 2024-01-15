import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final options = ['Megaman', 'Metal Gear', 'FIFA 2027', 'Final Fantasy'];
   
  ListView1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 1'),
      ),
      body: ListView(
        children: [
          ...options.map((game) => Text( game )).toList()





          /*
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text( 'Super SideKicks 3'),
            subtitle: Text('Esto es un juegazo de futbol de NEO GEO'),
            trailing: Icon( Icons.arrow_forward_ios_outlined),
            onTap: () {
              
            },
          ),
          const Divider(),
          */
          
        
        ],
      )
    );
  }
}