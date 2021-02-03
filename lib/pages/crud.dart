import 'package:diven_market/bd/operation.dart';
import 'package:diven_market/models/persona.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_core/firebase_core.dart';

class Consultar extends StatelessWidget {    

  //const CrearCuenta({Key key}) : super(key: key);
  static const String ROUTE = "/Crud";
  @override
  Widget build(BuildContext context) {
    
    //Persona persona = ModalRoute.of(context).settings.arguments;
    //Operation.persona();
    
    return Scaffold(      
      appBar: AppBar(
        title: Text("Añadir usuarios"),
        ),
      body: Container(
        
        decoration: BoxDecoration(
          //color: Colors.teal[900]
            image: DecorationImage(
                image:
                    NetworkImage("https://wallpapercave.com/wp/wp2873698.png"),
                fit: BoxFit.cover
             )
        ),
        child: _FormSave() //ConsultaFirebase(),     
      ),
    );
  }
}

class _FormSave extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();
  final nombreController =TextEditingController();
  final paternoController =TextEditingController();
  final maternoController =TextEditingController();
  final fechaNacController =TextEditingController();
  final generoController =TextEditingController();
  final correoController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget> [
            
            SizedBox(height: 10,),
            
            TextFormField(
              controller: nombreController,
              validator: (value) {
                if(value.isEmpty) {
                  return "tiene que colocar datos";
                }
                return null;
              },
              decoration: InputDecoration(                     
                labelText: "Nombre",              
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),                   
                  fillColor: Colors.white,
                  filled: true,
              ),                 
            ),

            SizedBox(height: 10,),
            
            TextFormField(
              controller: paternoController,
              validator: (value) {
                if(value.isEmpty) {
                  return "tiene que colocar datos";
                }
                return null;
              },
              decoration: InputDecoration(                     
                labelText: "Apellido paterno",              
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),                   
                  fillColor: Colors.white,
                  filled: true,
              ),                 
            ),
            
            SizedBox(height: 10,),
            
            TextFormField(
              controller: maternoController,
              validator: (value) {
                if(value.isEmpty) {
                  return "tiene que colocar datos";
                }
                return null;
              },
              decoration: InputDecoration(                     
                labelText: "Apellido materno",              
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),                   
                  fillColor: Colors.white,
                  filled: true,
              ),                 
            ),
            
            SizedBox(height: 10,), 
            
            TextFormField(
              controller: fechaNacController,
              validator: (value) {
                if(value.isEmpty) {
                  return "tiene que colocar datos";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Fecha de nacimiento",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            
            SizedBox(height: 10,),
            
            TextFormField(
              controller: generoController,
              validator: (value) {
                if(value.isEmpty) {
                  return "tiene que colocar datos";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Género",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
                        
            SizedBox(height: 10,),
            
            TextFormField(
              controller: correoController,
              validator: (value) {
                if(value.isEmpty) {
                  return "tiene que colocar datos";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Correo",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            
            SizedBox(height: 10,),

            RaisedButton(
              child: Text("Listar usuarios en consola"),
              onPressed: (){
                Operation.persona();
              }
            ),

            SizedBox(height: 10,),

            RaisedButton(
              child: Text("Guardar usuario"),
              onPressed: (){
                if(_formKey.currentState.validate()){                  
                  print("Guardar" + nombreController.text);
                  Operation.insert(
                    Persona(
                      nombre: nombreController.text,
                      paterno: paternoController.text,
                      materno: maternoController.text,
                      fechaNac: fechaNacController.text,
                      genero: generoController.text,                      
                      correo: correoController.text
                    )
                  );
                }
              },
            ),
         ],
        ),
      )
    );    
  }
}

//La clase que se encarga de consultas de la base de datos de firebase
class ConsultaFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de usuarios'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('persona').snapshots(),
          builder: (context, snapshot) {
            //Si no tenemos datos
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            //Si tenemos datos
            List<DocumentSnapshot> docs = snapshot.data.docs;
            return Container(
              child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (_, i) {
                    Map<String, dynamic> data = docs[i].data();
                    print('___');
                    print(data);
                    return ListTile(title: Text(data['correo']));
                  }),
            );
          },
        ),
      ),
    );
  }
}

Widget consultarUsuarios() {
  return FlatButton(
    color: Colors.teal[700],
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    onPressed: () {
      // Widget Mostrar(){
      //   child: ConsultaFirebase()
      // };
    },
    child: Text(
      "Mostrar usuarios actuales",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}
