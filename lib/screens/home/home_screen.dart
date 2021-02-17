import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:path/path.dart';
import '../../constans.dart';
import 'package:diven_market/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  
  static const String ROUTE = "/HomeScreen";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
      home: home(),
    );
  }
}

Widget home(){
  return Container(
    child: Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    ),
  );
}

AppBar buildAppBar(){
  return AppBar(
        backgroundColor: Colors.deepOrange[600],
        elevation: 0,
        leading: 
          IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            onPressed: (){
              
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

            },
          ),
          SizedBox(width: kDefaultPaddin / 2,),
        ],
      );
}