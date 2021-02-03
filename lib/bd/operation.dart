import 'package:diven_market/models/persona.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation{
  static Future<Database> _openDB() async{
    return openDatabase(
      join(await getDatabasesPath(),'persona.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE persona (id INTEGER PRIMARY KEY, nombre TEXT, paterno TEXT, materno TEXT, fechaNac TEXT, genero TEXT, correo TEXT)"
        );
      }, version: 1
    );
  }
  

  static Future<void> insert(Persona persona) async{    
    Database database = await _openDB();
    return database.insert("persona", persona.toMap()); 
  }

  static Future<void> delete(Persona persona) async{    
    Database database = await _openDB();
    return database.delete("persona", where: 'id = ?', whereArgs: [persona.id]); 
  }

  static Future<List<Persona>> persona() async{
    Database database = await _openDB();
    final List<Map<String, dynamic>> personaMap = await database.query("persona");
    
    for (var n in personaMap) {
      print("____"+n['nombre']);
    }
    
    return List.generate(
      personaMap.length,
      (i) => Persona(
        id: personaMap[i]['id'],
        nombre: personaMap[i]['nombre'],
        paterno: personaMap[i]['paterno'],
        materno: personaMap[i]['materno'],
        fechaNac: personaMap[i]['fechaNac'],
        genero: personaMap[i]['genero'],
        correo: personaMap[i]['correo']
      )
    );
  }
}

