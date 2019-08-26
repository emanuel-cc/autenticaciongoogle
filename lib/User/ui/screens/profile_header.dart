import 'package:autenticaciongoogle/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          
          case ConnectionState.waiting:
            print(snapshot.connectionState);
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
            
        }

      },
      
    );
    /*Scaffold(
      body: Stack(
        children: <Widget>[
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
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        /*CircleAvatar(
                          maxRadius: 50.0,
                          backgroundImage: NetworkImage(
                            
                             'https://img-cdn.hipertextual.com/files/2019/04/hipertextual-avengers-endgame-contiene-ultimo-cameo-stan-lee-2019632812.jpg?strip=all&lossy=1&quality=65&resize=740%2C490&ssl=1'),
                        ),*/
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data.photoUrl)
                            )
                          ),
                        ),
                        
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Nombre completo: ${snapshot.data.displayName}',textDirection: TextDirection.ltr ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text('Correo: ${snapshot.data.email}',textAlign: TextAlign.left,style: TextStyle(color: Colors.white24),)
                          ],
                        ),
                      ],
                    ),
                  ),
        ],
      ),
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("El usuario no está logueado");
      return Stack(
        children: <Widget>[
          Positioned(
            top: 64.0,
            left: 28.0,
            child: Container(
              height: 160.0,
              child: Text('Profile',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              //color: Colors.brown,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("No se pudo cargar la información. Haz login")
              ],
            ),
          ),
        ],
      );
    } else {
      print("Usuario logueado");
      print(snapshot.data.displayName);
      print(snapshot.data.email);
      return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.topLeft,
        child: Row(
          children: <Widget>[
            /*CircleAvatar(
                            maxRadius: 50.0,
                            backgroundImage: NetworkImage(
                              
                               'https://img-cdn.hipertextual.com/files/2019/04/hipertextual-avengers-endgame-contiene-ultimo-cameo-stan-lee-2019632812.jpg?strip=all&lossy=1&quality=65&resize=740%2C490&ssl=1'),
                          ),*/
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(snapshot.data.photoUrl))),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nombre completo: ${snapshot.data.displayName}',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Correo: ${snapshot.data.email}',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white24),
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}
