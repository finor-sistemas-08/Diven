import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class Principal extends StatelessWidget {
  //const CrearCuenta({Key key}) : super(key: key);
  static const String ROUTE = "/Principal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Principal"),
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
                consultarUsuarios(),
              ],
            ),
          ),
      ),            
    );
  }
}

class ConsultaFirebase extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Firebase',
      home: Scaffold(
        appBar: AppBar(title: Text('Lista de usuarios'),),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('usuarios').snapshots(),
          builder: (context, snapshot) {             
            //Si no tenemos datos
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
                );
            }            
            //Si tenemos datos
            List<DocumentSnapshot> docs = snapshot.data.docs;
            return Container(
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_,i){
                  Map<String, dynamic> data = docs[i].data();
                  print('___');
                  print(data);
                  return ListTile(title: Text(data['ci']));
                }
                ),
              );
           },          
          ),
      ),
    );
  }
}

Widget consultarUsuarios(){
  return FlatButton(
    color: Colors.teal[700],
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    onPressed: (){
      // Widget Mostrar(){
      //   child: ConsultaFirebase()
      // };
    },
    child: Text("Mostrar usuarios actuales", style: TextStyle(fontSize: 18, color: Colors.white),),
    );   
}


  
