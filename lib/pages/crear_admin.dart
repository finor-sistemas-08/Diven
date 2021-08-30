//import 'package:diven_market/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:diven_market/bd/crudFlutterFire.dart';
  
String coleccion = "usuarios";
Map<String, dynamic> documento;

//Variables que van a robar los valores de los TextField
final nameController = TextEditingController();
final passwordController = TextEditingController();
final mailController = TextEditingController();

class CrearAdmin extends StatelessWidget {

  //const CrearCuenta({Key key}) : super(key: key);  
  
  static const String ROUTE = "/CrearCuenta";

  @override
  Widget build(BuildContext context) {

    //Recibimos como parámetro de entrada un ¡objeto de la clase Usuario y lo guardamos en otro llamado "usuario"
    //Usuario usuario = ModalRoute.of(context).settings.arguments;
    
    //Guardamos los valores de las variables locales en el objeto de la clase Usuario
   // _init(documento);
        
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

                    correo(),
                    campoCorreo(),

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
  
// _init(Usuario usuario) {
//   nameController.text = usuario.name;
//   passwordController.text = usuario.password;
//   mailController.text = usuario.mail;
// } 
    

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
      controller: nameController,    
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        ),
    ),
  );
}

Widget correo(){
  return Text(
    "Inserte un correo",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 2,    
      ),
  );
}

Widget campoCorreo(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
    child: TextField(
      controller: mailController,            
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
        controller: passwordController,
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
        //controller: passwordController,
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
    onPressed: () async{      
      
      if(nameController.text != "" && passwordController.text != "" && mailController.text != ""){        
        documento = {
          "nombre" : nameController.text,
          "password" : passwordController.text,
          "correo" : mailController.text
        };
        
        await CrudFirestore().create(coleccion, documento);
        print("Se ha logrado insertar los datos");
      }
      else{
        print("No hay datos, debe ingresar información");
      }
    },
    child: Text("Crear", style: TextStyle(fontSize: 18, color: Colors.white))
  );  
}