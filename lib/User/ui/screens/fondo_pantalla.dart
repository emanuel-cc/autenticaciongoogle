import 'package:flutter/material.dart';

class FondoPantala extends StatefulWidget {
  @override
  _FondoPantallaState createState() => _FondoPantallaState();
}

class _FondoPantallaState extends State<FondoPantala> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 420.0,
        height: 430.0,
        child: Image.asset(
          'assets/images/appbarprofile.png',
          fit: BoxFit.cover,
        ),
        //color: Colors.green,
      );
  }
}
