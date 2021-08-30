import 'package:diven_market/models/producto.dart';
import 'package:diven_market/screens/sell/components/body.dart';
import 'package:flutter/material.dart';
import 'package:diven_market/bd/crudFlutterFire.dart';

class SellScreen extends StatelessWidget {
  
  static const String ROUTE = "/SellScreen";

  //const SellScreen({Key key}) : super(key: key);
  Map<String, dynamic> documentoProductos = {
      "id": 1,
      "titulo": "Yamaha PSS-A50",
      "precio": 950,
      "estado": "Nuevo",
      "categoria": "Instrumentos musicales",
      "imagen": "assets/images/bag_1.png",
      "descripcion": "Desde la interpretación hasta la grabación, este teclado móvil puede hacerlo todo. Mini teclado de alta calidad y sensible al tacto 42 voces (instrumentos) 138 tipos de arpegios Grabador de frases Efecto motion Conexión USB-MIDI Ligero y compacto Altavoz incorporado / toma de auriculares Alimentado por batería y bus USB (el adaptador de alimentación USB se vende por separado)",
      "marca": "Yamaha",
      "color": Color(0xFF3D82AE),
    };
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vender un Producto"),
        backgroundColor: Colors.green[900],
        ),
      body: Column(
        children: <Widget> [
          Body(),
          ElevatedButton (
            onPressed:() {
              InsertarProductos();
              },
            child: Text("Insertar Productos"),
            ),
        ],
      ),
    );
  }
            
  InsertarProductos() async{
    

    await CrudFirestore.create("Producto",documentoProductos);
  }
}