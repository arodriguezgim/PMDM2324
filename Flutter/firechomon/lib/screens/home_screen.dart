import 'package:firechomon/models/pelicula_model.dart';
import 'package:firechomon/provider/auth_provider.dart';
import 'package:firechomon/provider/peliculas_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final peliculasProvider =
        Provider.of<PeliculasProvider>(context, listen: false);
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

          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 2),
                () {

                  peliculas = peliculasProvider.obtenerPeliculas;
                  setState(() {
                    
                  });
                },
              );
            },
            child: ListView.builder(
                itemCount: peliculas.length,
                itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(), 
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Eliminar',
                        onPressed: (context) {
                          peliculasProvider.eliminarPelicula(peliculas[index]);
                          // Muestro un snackbar comentando que el producto se ha eliminado.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('La película se ha eliminado correctamente'),
                              backgroundColor: Colors.redAccent,
                              )
                          );
                          setState(() {
                            
                          });
                        },),
                        SlidableAction(
                        backgroundColor: Colors.green.shade300,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                        onPressed: (context) => null,),

                    ]),
                  child: ListTile(
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
                      ),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addPelicula');
        },
      ),
    );
  }
}
