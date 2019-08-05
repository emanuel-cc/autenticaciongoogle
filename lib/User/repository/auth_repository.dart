//Este archivo nos permite controlar las fuentes de datos
//switchear los datos

import 'package:firebase_auth/firebase_auth.dart';
import 'package:autenticaciongoogle/User/repository/firebase_auth_api.dart';

//Logica de negocio de una aplicacion que se conecta con firebase auth
//Implementacion de authRepository
class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase()=>_firebaseAuthAPI.signIn();
  //Apuntar a la fuente de datos de donde proviene
  signOut() => _firebaseAuthAPI.signOut();
}