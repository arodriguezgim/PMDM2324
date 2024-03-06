import 'dart:io';

import 'package:firechomon/provider/image_service.dart';
import 'package:firechomon/provider/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({Key? key}) : super(key: key);

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase Storage'),
        ),
        body: Column(
          children: [
            imagen_to_upload != null
                ? Image.file(imagen_to_upload!)
                : Container(
                    height: 200,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    color: Colors.grey,
                  ),
            ElevatedButton(
                onPressed: () async {
                  final XFile? imagen = await getImage();
                  setState(() {
                    //if (imagen_to_upload==null) return;
                    imagen_to_upload = File(imagen!.path);
                  });
                }, 
                child: const Text('Seleccionar Imagen')),

            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: () async {
                  if (imagen_to_upload == null){
                    return;
                  }
                  final uploaded = await uploadImage(imagen_to_upload!);

                  if (uploaded){
                    // Muestro un mensaje de exito
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Imagen subida correctamente')));
                  } else {
                    // Muestro un mensaje de error
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al subir la imagen')));
                  }
                }, 
                child: const Text('Subir Imagen a Firebase')),
          ],
        ));
  }
}
