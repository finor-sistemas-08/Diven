import 'package:diven_market/bd/operation.dart';
import 'package:diven_market/models/persona.dart';
import 'package:diven_market/pages/crud.dart';

import 'package:flutter/material.dart';

class Listausuarios extends StatelessWidget {
  static const String ROUTE = "/Lista_users";

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, Consultar.ROUTE);
          },
        ),     
      appBar: AppBar(
        title: Text("Listado de usuarios"),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image:
        //             NetworkImage("https://wallpapercave.com/wp/wp2873698.png"),
        //         fit: BoxFit.cover
        //   )
        // ),
        //child: _MyList(),
        child: _MyList(),
        // Column(
        //   children: [
        //     //_MyList(),
        //     FlatButton(
        //       color: Colors.teal[700],
        //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //       onPressed: () {
        //         _MyList();
        //       },
        //       child: Text(
        //         "Actualizar",
        //         style: TextStyle(fontSize: 18, color: Colors.white),
        //       ),            
        //     )
        //   ],
        // ),
      ),
    );
  }
}

class _MyList extends StatefulWidget {
  @override
  __MyListState createState() => __MyListState();
}

class __MyListState extends State<_MyList> {
  List<Persona> persona = [];

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: persona.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  //Carga datos de los usuarios
  _loadData() async {
    List<Persona> auxNote = await Operation.persona();

    setState(() {
      persona = auxNote;
      }
    );
  }

  _createItem(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction){
        print(direction);
        Operation.delete(persona[i]);
      },     
      child: ListTile(
        title: Text(persona[i].nombre),
        // trailing: MaterialButton(
        //   onPressed: (){
        //     Navigator.pushNamed(context, Consultar.ROUTE,arguments: persona[i]);
        //   },
        //   child: Icon(Icons.edit)),
      ),
    );
  }
}