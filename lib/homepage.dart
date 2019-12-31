import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/drink_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();

  }

  fetchData()async{
    res = await http.get(api);

    drinks = jsonDecode(res.body)["drinks"];
      print(drinks.toString());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        myColor,
        Colors.orange,
        Colors.white10
        
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Text("Product List"),)
        ),
        body: Center(
              child: res != null? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index){
                  var drink = drinks[index];
                  return ListTile(
                    leading: Hero(
                      tag: drink["idDrink"],
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            drink["strDrinkThumb"] ??
                            "https://image.shutterstock.com/image-vector/no-image-available-icon-vector-260nw-1323742826.jpg",
                        ),
                      ),
                    ),
                    title: Text(
                      "${drink["strDrink"]}",
                      style: TextStyle(
                        color: Colors.white,

                      ),
                    ),

                    subtitle: Text(
                      "${drink["idDrink"]}",
                      style: TextStyle(
                        color: Colors.white,


                      ),
                    ),

                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>DrinkDetail(drink: drink),
                          ),
                      );
                    },

                  );
                },
              )
                  :CircularProgressIndicator(backgroundColor: Colors.white),
            ),
        ),
    );
  }
}
