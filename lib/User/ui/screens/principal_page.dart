import 'package:autenticaciongoogle/User/bloc/bloc_user.dart';
import 'package:autenticaciongoogle/User/ui/screens/botones.dart';
import 'package:autenticaciongoogle/User/ui/screens/fondo_pantalla.dart';
import 'package:autenticaciongoogle/User/ui/screens/profile_header.dart';
import 'package:autenticaciongoogle/User/ui/screens/tarjetas_imagenes.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
            FondoPantala(),
            Positioned(
              top: 64.0,
              left: 28.0,
              child: Container(
                height: 160.0,
                child: Text('Profile',
                    style: TextStyle(fontSize: 30.0, color: Colors.white,fontWeight: FontWeight.bold)),
                //color: Colors.brown,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  ProfileHeader(),
                  Botones(),
                  SizedBox(
                    height: 30.0,
                  ),
                  ImagesPage()
                ],
              ),
            ),
            ],
      ),
    );
  }
}

/*

FondoPantala(),
              ProfileHeader(),
              Botones(),
              
              //ImagesPage()

*/