//Va a contener todos los datos de la aplicacion con respecto a la conexion con firebase
// es decir, la lógica de negocio de la conexion de la aplicacion con firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/docs/v1.dart';

import 'package:googleapis/people/v1.dart'
    show ListConnectionsResponse, PeopleApi;

//Definimos una clase
class FirebaseAuthAPI{
  //Definimos las variables globales
  //Va a contener la instancia de FirebaseAuth
  //Nos trae la composición de todo lo que existe en la consola de firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Va a contener la instancia de GoogleSignin
  //Nos trae la composición de todo lo que existe en Google
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    //Se crea una instancia de GoogleSignAccount
    //Se está solicitando el cuadro de dialogo de inicio de sesion en google
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // final authHeaders = googleSignIn.currentUser.authHeaders;

  //Se obtiene las credenciales de la cuenta de google
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

  //Se hace la autenticacion con firebase
    //Verifica si la cuenta existe
    FirebaseUser user = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: gSA.idToken,accessToken:gSA.accessToken));
    return user;
  }
  //Método para cerrar sesión
  signOut() async {
    //Cerrar sesión en Firebase
    await _auth.signOut().then((onValue) => print('Sesión cerrada'));
    //Cerrar sesión en google
    googleSignIn.signOut();
    print('Sesiones cerradas');
  }
}