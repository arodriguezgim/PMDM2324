import 'package:firechomon/models/pelicula_model.dart';
import 'package:firechomon/provider/auth_provider.dart';
import 'package:firechomon/provider/peliculas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final peliculasProvider = Provider.of<PeliculasProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas Disponibles'),
          actions: [
            IconButton.filledTonal(
                onPressed: () => authProvider.signOut(),
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: FutureBuilder(
          future: peliculasProvider.obtenerListaPeliculas(),
          builder: (context, snapshot) {
            List<Pelicula> peliculas = peliculasProvider.obtenerPeliculas;

            return ListView.builder(
                itemCount: peliculas.length,
                itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            peliculas[index].urlImagen ??
                                'https://via.placeholder.com/150'),
                      ),
                      title: Text(peliculas[index].titulo ?? 'Sin titulo'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(peliculas[index].sinopsis ??
                              'No disponible sinopsis'),
                          const SizedBox(height: 5),
                          Text(peliculas[index].anio.toString())
                        ],
                      ),
                    ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/addPelicula');
          },),
        );
        
  }
}
