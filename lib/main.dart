import 'package:diven_market/screens/sell/sell_screen.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//Las páginas o vistas que tendrá mi app
import 'package:diven_market/pages/lista_usuarios.dart';
import 'package:diven_market/pages/login.dart';
import 'package:diven_market/pages/crear_admin.dart';
import 'package:diven_market/pages/principal.dart';
import 'package:diven_market/pages/add_persona.dart';
import 'package:diven_market/screens/home/home_screen.dart';

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
        CrearAdmin.ROUTE : (_) => CrearAdmin(),
        '/Crud' : (_) => AddPersona(),
        '/Principal' : (_) => Principal(),
        '/Lista_users' : (_) => Listausuarios(),
        '/HomeScreen' : (_) => HomeScreen(),
        '/SellScreen' : (_) => SellScreen(),
      },      
    );          
  }
}

