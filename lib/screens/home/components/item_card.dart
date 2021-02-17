
import 'package:diven_market/models/producto.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';

class ItemCard extends StatelessWidget {
  final Producto product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        //Alineamiento del Text
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            //height: 300,
            //width: 300,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16),
              ),
            child: Hero(
              tag: "${product.id}",              
              child: Image.asset(product.imagen)
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.titulo,
              style: TextStyle(color: kTextLightColor),
              ),
          ),
          Text(
            "\Bs. ${product.precio}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]         
      ),
    );
  }
}
