import 'package:flutter/material.dart';
import 'package:flutter_app/homepage.dart';

const Color myColor = Colors.red;

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Product List",
      theme: ThemeData(
        primarySwatch: myColor,
        fontFamily: "Pacifico",
      ),
      home: HomePage(),
    );
  }
}
