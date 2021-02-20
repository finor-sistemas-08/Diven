import 'package:diven_market/screens/sell/components/body.dart';
import 'package:flutter/material.dart';

class SellScreen extends StatelessWidget {
  
  static const String ROUTE = "/SellScreen";

  //const SellScreen({Key key}) : super(key: key);

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
        ],
      ),
    );
  }
}