import 'package:flutter/material.dart';

class CardPersonalizada1 extends StatelessWidget {
  const CardPersonalizada1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon( Icons.photo_album_outlined),
            title: Text('Hola soy un Titulo'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Ok'),
                  ),
                TextButton(
                  style: const ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {}, 
                  child: const Text('Cancelar'),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}