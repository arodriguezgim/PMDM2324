import 'package:firechomon/models/pelicula_model.dart';
import 'package:firechomon/provider/peliculas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPeliculaScreen extends StatelessWidget {
   
  const AddPeliculaScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final TextEditingController tituloController = TextEditingController();
    final TextEditingController sinopsisController = TextEditingController();
    final TextEditingController anioController = TextEditingController();
    final TextEditingController directorController = TextEditingController();
    final TextEditingController urlImageController = TextEditingController();

    final peliculasProvider = Provider.of<PeliculasProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir Pelicula'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: sinopsisController,
                decoration: const InputDecoration(labelText: 'Sinopsis'),
              ),
              TextField(
                controller: anioController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Año'),
              ),
              TextField(
                controller: directorController,
                decoration: const InputDecoration(labelText: 'Nombre del director'),
              ),
              TextField(
                controller: urlImageController,
                decoration: const InputDecoration(labelText: 'Url Cartelera'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Pelicula pelicula = Pelicula(
                  titulo: tituloController.text,
                  sinopsis: sinopsisController.text,
                  anio: int.parse(anioController.text),
                  director: directorController.text,
                  urlImagen: urlImageController.text
                );
                peliculasProvider.anadirPelicula(pelicula);
                Navigator.pop(context);
              }, child: const Text('Añadir Película'))
            ],
          ),
        ),
      ),
    );
  }
}