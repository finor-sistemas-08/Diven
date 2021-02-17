import 'package:diven_market/models/producto.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Producto product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPaddin,
        ),
      child: Text(
        product.descripcion,
        style: TextStyle(height: 1.5),
        ),
    );
  }
}

