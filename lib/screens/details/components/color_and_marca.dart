import 'package:diven_market/models/producto.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';

class EstadoAndMarca extends StatelessWidget {
  const EstadoAndMarca({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Producto product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Estado"),                              
              Row(
                children: <Widget>[
                  ColorDot(),
                ],
              ),
            ],
          ),
        ),
      Expanded(
        child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "Marca\n",),
                TextSpan(
                  text: "${product.marca}",
                  style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
                  ),
              ]
            ),
          ),
      ),
      ],                        
    );
  }
}

class ColorDot extends StatelessWidget {
  //final Color color;
  //final bool isSelected;

  const ColorDot({
    Key key, 
    //this.color, 
    //this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin /2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFF356C95),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.green[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}