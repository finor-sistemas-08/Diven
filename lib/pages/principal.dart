import 'package:flutter/material.dart';
import 'package:diven_market/screens/home/home_screen.dart';
//import 'package:diven_market/pages/crud.dart';

import 'package:diven_market/pages/lista_usuarios.dart';

class Principal extends StatelessWidget {
  //const CrearCuenta({Key key}) : super(key: key);
  static const String ROUTE = "/Principal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingrese a una de las opciones'),
        backgroundColor: Colors.cyan,              
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    NetworkImage("https://wallpapercave.com/wp/wp2873698.png"),
                fit: BoxFit.cover)),
        child: Center(
          //child: HomeScreen(),
          child: ListView(
            children: <Widget>[
              consultarUsuarios(context),
              entrarHome(context),
            ],
          ),
         ),
      ),
    );
  }
}

//Botón para entrar al CRUD de usuarios
Widget consultarUsuarios(BuildContext context) {
  return FlatButton(
    color: Colors.teal[700],
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    onPressed: () {
      Navigator.pushNamed(context, Listausuarios.ROUTE);
    },
    child: Text(
      "Lista de usuarios",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}

//Botón para entrar al home de la app
Widget entrarHome(BuildContext context) {
  return FlatButton(
    color: Colors.teal[700],
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    onPressed: () {
      Navigator.pushNamed(context, HomeScreen.ROUTE);
    },
    child: Text(
      "Home",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}