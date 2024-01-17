import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {

  final options = [
    'Megaman', 
    'Metal Gear', 
    'FIFA 2027', 
    'Final Fantasy',
    'Megaman', 
    'Metal Gear', 
    'FIFA 2027', 
    'Final Fantasy',
    'Megaman', 
    'Metal Gear', 
    'FIFA 2027', 
    'Final Fantasy',
    'Megaman', 
    'Metal Gear', 
    'FIFA 2027', 
    'Final Fantasy',
    'Megaman', 
    'Metal Gear', 
    'FIFA 2027', 
    'Final Fantasy',
    ];
   
  ListView2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView 2'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, i ) {
          return ListTile(
            leading: const Icon( Icons.child_care),
            title: Text( options[i] ),
            subtitle: Text( options[i] ),
            trailing: const Icon( Icons.arrow_forward_ios_outlined,),
            onTap: () {     
            },
          );
        }, 
        separatorBuilder: ( _ , __ ) => const Divider(),
        )
    );
  }
}