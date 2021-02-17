import 'package:diven_market/constans.dart';
import 'package:diven_market/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {

  final Producto product;

  //Constructor
  const DetailsScreen({
    Key key,
    this.product
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color, //Colors.indigo[400],
      appBar: buildAppBar(context),
      body: Body(product: product,),
    );
  }


  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: product.color, //Colors.lightBlue[900],
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg'),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: (){},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: (){},
        ),
        SizedBox(
          width: kDefaultPaddin,
        )
      ],
    );
  }
}