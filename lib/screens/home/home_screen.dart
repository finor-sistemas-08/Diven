import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:path/path.dart';
import '../../constans.dart';
import 'package:diven_market/screens/home/components/body.dart';
import 'package:diven_market/screens/sell/sell_screen.dart';

class HomeScreen extends StatelessWidget {
  
  static const String ROUTE = "/HomeScreen";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
      home: home(context),
    );
  }
}

Widget home(BuildContext context){
  return Container(
    child: Scaffold(
      //backgroundColor: Colors.blueGrey[900],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(
                "paulluna@gmail.com",
                //style: ,
              ),
              accountName: Text(
                "Jean Paul",
                //color: Colors.white,
              ),
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text(
                 "Añadir tarjeta de crédito",
              ),
              onTap: () {
                //changeScreen(context, CreditCard(title: "Add card",));
              },
            ),

            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text(
                "Administrar tarjetas",
              ),
              onTap: () {
                //changeScreen(context, ManagaCardsScreen());
              },
            ),

            ListTile(
              leading: Icon(Icons.history),
              title: Text(
                "Historial de compras",
              ),
              onTap: () {
                // changeScreen(context,Purchases());
              },
            ),

            ListTile(
              leading: Icon(Icons.memory),
              title: Text(
                "Suscripciones",
              ),
              onTap: () {
                //changeScreen(context, ManagaCardsScreen());
              },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Cerrar sesión",
              ),
              onTap: () {
                // user.signOut();
                // changeScreenReplacement(context, LoginOne());
              },
            ),
          ],
        ),
      ),
      appBar: buildAppBar(context),
      body: Body(),
    ),
  );
}

AppBar buildAppBar(BuildContext context){
  return AppBar(
        backgroundColor: Colors.deepOrange[600],
        elevation: 0,
        leading: 
          IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            onPressed: (){
              Navigator.pushNamed(context, "/Principal");
            },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: kTextColor,
              ),
            onPressed: (){

            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: kTextColor,
              ),
            onPressed: (){
              Navigator.pushNamed(context, SellScreen.ROUTE);
            },
          ),
          SizedBox(width: kDefaultPaddin / 2,),
        ],
      );
}