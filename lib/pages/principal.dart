import 'package:flutter/material.dart';
//import 'package:diven_market/pages/crud.dart';

import 'package:diven_market/pages/lista_usuarios.dart';

class Principal extends StatelessWidget {
  //const CrearCuenta({Key key}) : super(key: key);
  static const String ROUTE = "/Principal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal de la app'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    NetworkImage("https://wallpapercave.com/wp/wp2873698.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            children: <Widget>[
              consultarUsuarios(context),
            ],
          ),
        ),
      ),
    );
  }
}

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