import 'package:flutter/material.dart';

class CrearCuenta extends StatelessWidget {
  //const CrearCuenta({Key key}) : super(key: key);
  static const String ROUTE = "/CrearCuenta";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Crear nueva cuenta de usuario"),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://wallpapercave.com/wp/wp2873698.png"),
                fit: BoxFit.cover
            )
          ),
          child: Center(
            child: ListView(
              children: <Widget> [
                nombre(),
                campoNombre(),
                contrasena(),
                campoContrasena(),
                contrasena2(),
                campoContrasena2(),
                SizedBox(height: 7),
                botonCrear(),
              ],
            ),
          ),
      ),            
    );
  }
}

Widget nombre(){
  return Text(
    "Inserte un nombre",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 2,    
      ),
  );
}

Widget campoNombre(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        ),
    ),
  );
}


Widget contrasena(){
  return Text(
    "Inserte una contraseña",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      height: 2,    
      fontWeight: FontWeight.bold,    
      ),
  );
}

Widget campoContrasena(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
    child: TextField(
        obscureText: true,      
        decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        ),
    ),
  );
}

Widget contrasena2(){
  return Text(
    "Vuelva a repetir la contraseña",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,    
      height: 2,    
      ),
  );
}

Widget campoContrasena2(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
    child: TextField(
        obscureText: true,      
        decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        ),
    ),
  );
}

Widget botonCrear(){
  return FlatButton(
    color: Colors.cyan[900],
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    onPressed: (){
    },
    child: Text("Crear", style: TextStyle(fontSize: 18, color: Colors.white))
  );  
}