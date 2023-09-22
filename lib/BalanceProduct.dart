import 'package:flutter/material.dart';
import 'package:sqflite3/helper/DatabaseHelper.dart';

class BalanceProduct extends StatefulWidget {



  @override
  State<BalanceProduct> createState() => _BalanceProductState();
}

class _BalanceProductState extends State<BalanceProduct> {
  var possition = 0;

  var totalincome=0.0;
  var totalexpance=0.0;
  var totalbalance=0.0;

  getadata()async{
    DatabaseHelper obj = DatabaseHelper();
   List alldata =await obj.ViewProduct();

    for(var Row in alldata) {

      if(Row["Radio"].toString()=="expance")
        {
              setState(() {
                totalexpance = totalexpance + double.parse(Row["Amount"].toString());
              });
        }
      else
        {
          setState(() {
            totalincome = totalincome + double.parse(Row["Amount"].toString());
          });
        }

      totalbalance = totalincome - totalexpance;

    }}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getadata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("BalanceProduct"),
      // ),
      body:Container(
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.cyanAccent,
        padding: EdgeInsets.all(20.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 10.0,),
                Text("Totle Income "+totalincome.toString(),style: TextStyle(
                    color: Colors.green
                ),),
                SizedBox(width: 10.0,),
                Text("Totle Expance "+totalexpance.toString(),style: TextStyle(
                  color: Colors.red
                ),),

              ],
            ),
            SizedBox(height: 50.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Totle Balance  "+totalbalance.toString()),
              ],
            )
          ],
        ),

      ),
    );
    
  }
}
