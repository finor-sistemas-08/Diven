import 'package:diven_market/models/producto.dart';
import 'package:flutter/material.dart';


class AddToBuy extends StatelessWidget {
  const AddToBuy({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Producto product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        //Para el carrito de compras                      
        //
        //     Container(
        //       height: 50,
        //       width: 58,
        //       decoration: BoxDecoration(
        //         border: Border.all(color: product.color),
        //       ),
        //     ),
       Expanded(
         child: SizedBox(
           height: 50,                            
           child: FlatButton(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(18),
               ),
             color: product.color,
             onPressed: (){
               
             },
             child: Text("Comprar".toUpperCase(),
               style: TextStyle(
                 fontSize: 17,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
               )
             ),
         ),
       ),
      ],
    );
  }
}


