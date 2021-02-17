import 'package:diven_market/bd/operation.dart';
import 'package:diven_market/models/persona.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_core/firebase_core.dart';

class Consultar extends StatefulWidget {
  //const CrearCuenta({Key key}) : super(key: key);
  static const String ROUTE = "/Crud";

  @override
  _ConsultarState createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final paternoController = TextEditingController();
  final maternoController = TextEditingController();
  final fechaNacController = TextEditingController();
  final generoController = TextEditingController();
  final correoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Persona persona = ModalRoute.of(context).settings.arguments;
    //Operation.persona();
    _init(persona);

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Añadir usuarios"),
        ),
        body: Container(
            decoration: BoxDecoration(
                //color: Colors.teal[900]
                image: DecorationImage(
                    image: NetworkImage(
                        "https://wallpapercave.com/wp/wp2873698.png"),
                    fit: BoxFit.cover)),
            child: _bluidform(persona) //ConsultaFirebase(),
            ),
      ),
    );
  }

  _init(Persona persona) {
    nombreController.text = persona.nombre;
    paternoController.text = persona.paterno;
    maternoController.text = persona.materno;
    fechaNacController.text = persona.fechaNac;
    generoController.text = persona.genero;
    correoController.text = persona.correo;
  }

  Widget _bluidform(Persona persona) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nombreController,
                validator: (value) {
                  if (value.isEmpty) {
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: paternoController,
                validator: (value) {
                  if (value.isEmpty) {
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: maternoController,
                validator: (value) {
                  if (value.isEmpty) {
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: fechaNacController,
                validator: (value) {
                  if (value.isEmpty) {
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: generoController,
                validator: (value) {
                  if (value.isEmpty) {
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: correoController,
                validator: (value) {
                  if (value.isEmpty) {
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
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text("Listar usuarios en consola"),
                  onPressed: () {
                    Operation.persona();
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text("Guardar usuario"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (persona.id != null) {
                        //Actualización en SQLite
                        persona.nombre = nombreController.text;
                        persona.paterno = paternoController.text;
                        persona.materno = maternoController.text;
                        persona.fechaNac = fechaNacController.text;
                        persona.genero = generoController.text;
                        persona.correo = correoController.text;
                        Operation.update(persona);
                      } else {
                        
                        //INSERCIÓN                        
                        //Para insertar a firebase
                        FirebaseFirestore.instance.collection('persona').add({
                          "nombre" : nombreController.text,
                          "paterno" : paternoController.text,
                          "materno" : maternoController.text,
                          "fecha_nac" : fechaNacController.text,
                          "genero" : generoController.text,
                          "correo" : correoController.text,
                          }
                        );
                        
                        //Inserción en SQLite
                        Operation.insert(Persona(
                                nombre: nombreController.text,
                                paterno: paternoController.text,
                                materno: maternoController.text,
                                fechaNac: fechaNacController.text,
                                genero: generoController.text,
                                correo: correoController.text)
                            //print("Guardar" + nombreController.text);
                          );
                      }
                    }
                  })
            ],
          ),
        ));
  }

  Future<bool> _onWillPopScope() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("¿Seguro que quieres volver atrás?"),
              content: Text("Tienes datos sin guardar"),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Yes"),
                ),
              ],
            ));
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

// Widget consultarUsuarios() {
//   return FlatButton(
//     color: Colors.teal[700],
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//     onPressed: () {
//       // Widget Mostrar(){
//       //   child: ConsultaFirebase()
//       // };
//     },
//     child: Text(
//       "Mostrar usuarios actuales",
//       style: TextStyle(fontSize: 18, color: Colors.white),
//     ),
//   );
// }
