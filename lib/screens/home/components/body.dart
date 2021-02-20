import 'package:diven_market/constans.dart';
import 'package:diven_market/models/producto.dart';
import 'package:diven_market/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:diven_market/screens/home/components/categorias.dart';

import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Diven Market",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categorias(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: productos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: productos[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: productos[index],
                      ),
                    )),
              ),
            ),
        )),
      ],
    );
  }
}
