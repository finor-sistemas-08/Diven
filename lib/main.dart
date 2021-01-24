import 'package:flutter/material.dart';

//Cloud Firestore Plugin para Flutter 
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(        
        //El diseño del Login se carga de esta manera
        body: cuerpo(),
      ),
    );
  }
}

//Widget con la imagen de fondo y el cuerpo del Login
Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://wallpapercave.com/wp/wp2873698.png"),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nombre(),
          SizedBox(height: 7),
          campoUsuario(),
          campoContrasena(),
          SizedBox(height: 7),
          botonEntrar(),
        ],
      ),
    ),
  );
}

//Widget para el título de "Iniciar Sesión"
Widget nombre() {
  return Text(
    "Diven Market",
    style: TextStyle(
        color: Colors.cyan[50], 
        fontSize: 31.0, 
        fontWeight: FontWeight.bold
      ),
  );
}

//Campo para insertar datos de usuario
Widget campoUsuario(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,      
      ),
    ),
  );
}

Widget campoContrasena(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 3),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,      
      ),
    ),
  );
}

Widget botonEntrar(){
  return FlatButton(
    color: Colors.cyan[900],
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    onPressed: (){},
    child: Text("Entrar", style: TextStyle(fontSize: 18, color: Colors.white))
  );
}