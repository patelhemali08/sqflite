import 'package:flutter/material.dart';
import 'package:sqflite3/AddProduct.dart';
import 'package:sqflite3/HomePage.dart';
import 'package:sqflite3/HomePage2.dart';
import 'package:sqflite3/UpdateProduct.dart';
import 'package:sqflite3/ViewProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

