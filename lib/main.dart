import 'package:autenticaciongoogle/User/bloc/bloc_user.dart';
import 'package:autenticaciongoogle/User/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          child: MaterialApp(
        home: SignInScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}