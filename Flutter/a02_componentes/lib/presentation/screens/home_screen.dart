import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final colores = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Componentes'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Botones'),
            subtitle: const Text('Ir a la página de Botones'),
            leading: Icon( Icons.radio_button_on, color: colores.primary, ),
            trailing: Icon( Icons.arrow_forward_ios_outlined, color: colores.primary,),
            onTap: () => Navigator.pushNamed(context, 'botones'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Lista tipo 1'),
            subtitle: const Text('Ir a la página de Lista tipo 1'),
            leading:  Icon( Icons.account_balance, color: colores.primary,),
            trailing:  Icon( Icons.arrow_forward_ios_outlined, color: colores.primary,),
            onTap: () => Navigator.pushNamed(context, 'lista1'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Lista tipo 2'),
            subtitle: const Text('Ir a la página de Lista tipo 2'),
            leading:  Icon( Icons.join_full, color: colores.primary,),
            trailing: Icon( Icons.arrow_forward_ios_outlined, color: colores.primary,),
            onTap: () => Navigator.pushNamed(context, 'lista2'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Tarjetas'),
            subtitle: const Text('Ir a la página de Tarjetas personalizadas'),
            leading:  Icon( Icons.card_giftcard, color: colores.primary,),
            trailing: Icon( Icons.arrow_forward_ios_outlined, color: colores.primary,),
            onTap: () => Navigator.pushNamed(context, 'card'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Otras Tarjetas'),
            subtitle: const Text('Otras tarjetas personalizas'),
            leading:  Icon( Icons.car_rental, color: colores.primary,),
            trailing: Icon( Icons.arrow_forward_ios_outlined, color: colores.primary,),
            onTap: () => Navigator.pushNamed(context, 'card2'),
          ),
          const Divider(),
        ],
      )
    );
  }
}