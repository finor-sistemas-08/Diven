import 'package:flutter/material.dart';
import 'package:diven_market/constans.dart';

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  List<String> categorias = ["Tecnología", "Alimentos", "Limpieza", "Servicios", "Ropa", "Instrumentos Musicales", "Electrónica"];
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
         height: 25,
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: categorias.length,
           itemBuilder: (context, index) => buildCategoria(index),
           ),
      ),
    );
  }

  Widget buildCategoria(int index){
    return GestureDetector(
      onTap: () {
        setState((){
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              categorias[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ]
        ),
      ),
    );
  }
}