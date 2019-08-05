import 'package:autenticaciongoogle/User/ui/screens/fondo_pantalla.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              FondoPantala(),
              
            ],
          )
        ],
      ),
    );
  }
}