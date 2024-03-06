import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File imagen) async {
  //print("Ruta de la imagen" + imagen.path);
  // dividimos el nombre de la ruta del archivo enpartes separadas por '/'
  // y nos quedamos con la última.
  final String nombreImagen = imagen.path.split('/').last;

  final Reference ref =
      storage.ref().child('imagenes').child('alberto').child(nombreImagen);
  final UploadTask uploadTask = ref.putFile(imagen);
  //print(uploadTask);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  //print(snapshot);
  //Vamos a obtener la url del archivo subido a Storage
  final String url = await snapshot.ref.getDownloadURL();
  //print(url);

  if (snapshot.state == TaskState.success) {
    return true;
  } else {
    return false;
  }
}