import 'package:flutter/material.dart';
import 'package:sqflite3/AddProduct.dart';
import 'package:sqflite3/ViewProduct.dart';

class HomePage2 extends StatefulWidget {
 

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage2"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewProduct())
                );
              },
              title: Text("viewProduct"),
            ),
            Divider(color: Colors.black,),
            ListTile(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddProduct())
                );
              },
              title: Text("AddProduct"),
            ),
            Divider(color: Colors.black,),
          ],
        ),
      ),
      
    );
  }
}
