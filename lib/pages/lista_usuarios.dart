import 'package:diven_market/bd/operation.dart';
import 'package:diven_market/models/persona.dart';
import 'package:diven_market/pages/crud.dart';

import 'package:flutter/material.dart';

class Listausuarios extends StatelessWidget {
  static const String ROUTE = "/Lista_users";

  @override
  Widget build(BuildContext context) {
    return _MyList();
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
    return Scaffold( 
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, Consultar.ROUTE, arguments: Persona.empty()).then((value) => setState((){
              _loadData();
            }));
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
        child: ListView.builder(
                itemCount: persona.length,
                itemBuilder: (_, i) => _createItem(i),
              )       
      ),
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
        trailing: 
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(
                context, 
                Consultar.ROUTE, 
                arguments: persona[i]).then((value) => setState((){
                  _loadData();
                }));
            },
            child: Icon(Icons.edit)
          ),
      ),
    );
  }
}