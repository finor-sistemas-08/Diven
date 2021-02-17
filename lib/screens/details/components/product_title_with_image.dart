import 'package:diven_market/models/producto.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';


class ProductoTitleWithImage extends StatelessWidget {
  const ProductoTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Producto product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Instrumentos Musicales",
            style: TextStyle(
              color: Colors.white
              ),
          ),
          Text(
            product.titulo,
            style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          // SizedBox(
          //   height: kDefaultPaddin,
          // ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Precio\n"),
                    TextSpan(
                      text: "\Bs. ${product.precio}",
                      style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold                                    
                        )
                      ),
                    ]
                  )
                ),
              SizedBox(
                width: kDefaultPaddin+14,
              ),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.imagen,
                    fit: BoxFit.fill,
                    ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}