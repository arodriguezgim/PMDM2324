import 'package:flutter/material.dart';
import 'package:menu_dash/presentation/provider/counter_provider.dart';
import 'package:menu_dash/presentation/screens/sub_screens/provider_pages/pagina1_widget.dart';
import 'package:menu_dash/presentation/screens/sub_screens/provider_pages/pagina2_widget.dart';
import 'package:menu_dash/presentation/screens/sub_screens/provider_pages/pagina3_widget.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatefulWidget {
   
   ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  final List<Widget> _paginas = [
    Pagina1Widget(),
    Pagina2Widget(),
    Pagina3Widget(),
  ];

  int _paginaSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manejador Provider',),
        actions: [
          TextButton(
            onPressed: null, 
            child: Text( context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(color: Colors.white),
            )
            )
        ],
        ),
      body: _paginas[_paginaSeleccionada],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSeleccionada,
        onTap: (value) {
          setState(() {
            _paginaSeleccionada = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Pagina 1',
            icon: Icon(Icons.home)
            ),
          BottomNavigationBarItem(
            label: 'Pagina 2',
            icon: Icon(Icons.donut_large)
            ),
          BottomNavigationBarItem(
            label: 'Pagina 3',
            icon: Icon(Icons.drafts)
            ),
        ]
        ),
    );
  }
}