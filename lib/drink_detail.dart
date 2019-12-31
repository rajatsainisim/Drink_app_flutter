import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key,@required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        myColor,
        Colors.lightBlue,
        Colors.purple,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(drink["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                "ID:  ${drink["idDrink"]}",
                style: TextStyle(
                  color: Colors.white,


                ),
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                "${drink["strDrink"]}",
                style: TextStyle(
                  color: Colors.white,


                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
