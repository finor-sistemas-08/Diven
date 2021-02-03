
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

//Las páginas o vistas que tendrá mi app
import 'package:diven_market/pages/crear_cuenta.dart';
//import 'package:diven_market/pages/consultas.dart';
import 'package:diven_market/pages/principal.dart';

class Login extends StatelessWidget {

  static const String ROUTE = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }
}

//Widget con la imagen de fondo y el cuerpo del Login
Widget cuerpo(BuildContext context) {
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
          botonEntrar(context),
          botonCrearCuenta(context),          
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

Widget botonEntrar(BuildContext context){
  return FlatButton(
    color: Colors.cyan[900],
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    onPressed: (){
    //   List<DocumentSnapshot> documentList = (await FirebaseFirestore.instance
    //      .collection("cases")
    //      .document(await firestoreProvider.getUid())
    //      .collection(caseCategory)
    //      .where("caseNumber", arrayContains: query)
    //      .getDocuments())
    //  .documents;
      
      Navigator.pushNamed(context, Principal.ROUTE);
    },
    child: Text("Entrar", style: TextStyle(fontSize: 18, color: Colors.white))
  );  
}

Widget botonCrearCuenta(BuildContext context) {
    return FlatButton(  
    color: Colors.teal[700],
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    onPressed: (){
      Navigator.pushNamed(context, CrearCuenta.ROUTE);
    },
    child: Text("Crear Cuenta", style: TextStyle(fontSize: 18, color: Colors.white),),
    );
}

