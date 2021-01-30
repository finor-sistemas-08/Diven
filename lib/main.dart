import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//Las páginas o vistas que tendrá mi app
import 'package:diven_market/pages/login.dart';
import 'package:diven_market/pages/usuarios.dart';
import 'package:diven_market/pages/consultas.dart';
import 'package:diven_market/pages/principal.dart';

//import 'package:firebase_auth/firebase_auth.dart'

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//La clase que llama al diseño del login
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "Login.ROUTE",
      routes: {
        Login.ROUTE : (_) => Login(),
        CrearCuenta.ROUTE : (_) => CrearCuenta(),
        '/Consultas' : (_) => Consultar(),
        '/Principal' : (_) => Principal(),
      },      
    );          
  }
}

//La clase que se encarga de consultas de la base de datos de firebase
