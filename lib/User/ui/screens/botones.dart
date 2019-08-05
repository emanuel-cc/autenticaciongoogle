import 'package:autenticaciongoogle/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class Botones extends StatefulWidget {
  @override
  _BotonesState createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.white70,
              child: IconButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                iconSize: 20.0,
                icon: Icon(Icons.vpn_key),
                tooltip: 'Tocar',
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            CircleAvatar(
              maxRadius: 30.0,
              backgroundColor: Colors.white,
              child: IconButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                iconSize: 40.0,
                icon: Icon(Icons.add),
                tooltip: 'Tocar',
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.white70,
              child: IconButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                iconSize: 20.0,
                icon: Icon(Icons.exit_to_app),
                tooltip: 'Tocar',
                onPressed: () {
                  userBloc.signOut();
                },
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
