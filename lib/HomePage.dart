import 'package:flutter/material.dart';
import 'package:sqflite3/AddProduct.dart';
import 'package:sqflite3/BalanceProduct.dart';
import 'package:sqflite3/ViewProduct.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          bottom:TabBar(

            tabs: [
              Tab(
                child: Text("ViewProduct"),
              ),
              Tab(
                child: Text("Balance"),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>AddProduct()));
            },
            label:Icon(Icons.add),
        ),
        body: TabBarView(
          children: [
                 ViewProduct(),
            BalanceProduct(),
          ],
        ),
    ),
    );
  }
}
