import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechomon/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Usuario? _userFromFirebase( User? user ){
    if ( user == null ) {
      return null;
    }
    return Usuario(user.uid, user.email);
  }

  Stream<Usuario?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }
  
  // Funcion de crear un usuario and password

  // Funcion de loguearse con un usuario and password existente

  // Funcion de sign out()
}