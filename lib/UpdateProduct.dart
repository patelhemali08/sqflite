import 'package:flutter/material.dart';
import 'package:sqflite3/ViewProduct.dart';
import 'package:sqflite3/helper/DatabaseHelper.dart';

class UpdateProduct extends StatefulWidget {
var id;
  UpdateProduct({this.id});
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {


  var select = "income";

  TextEditingController _title = TextEditingController();
  TextEditingController _discription = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _date = TextEditingController();

  getdata()async{

    DatabaseHelper obj = new DatabaseHelper();
   var updatedata = await  obj.getsingleproduct(widget.id);
    setState(() {
      _title.text = updatedata[0]["Title"].toString();
      _discription.text = updatedata[0]["Description"].toString();
      _amount.text = updatedata[0]["Amount"].toString();
      _date.text = updatedata[0]["DateTime"].toString();
      select = updatedata[0]["Radio"].toString();
      print(_title.text);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpdateProduct"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Title"),
            TextField(
              controller: _title,
              keyboardType: TextInputType.text,
            ),
            Text("Description"),
            TextField(
              controller: _discription,
              keyboardType: TextInputType.text,
            ),
            Text("Amount"),
            TextField(
              controller: _amount,
              keyboardType: TextInputType.number,
            ),
            Text("DateTime"),
            TextField(
              controller: _date,
              keyboardType: TextInputType.number,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Radio :"),
                SizedBox(width: 50.0,),
                Text("income"),
                Radio(
                  value: "income",
                  groupValue: select,
                  onChanged: (val) {
                    setState(() {
                      select = val as String;
                    });
                  },
                ),
                SizedBox(width: 20.0,),
                Text("expance"),
                Radio(
                  value: "expance",
                  groupValue: select,
                  onChanged: (val) {
                    setState(() {
                      select = val as String;
                    });
                  },
                ),
              ],
            ),
            Divider(color: Colors.black,),
            SizedBox(width: 20.0,),

            ElevatedButton(
                onPressed: (){

                  var title = _title.text.toString();
                  var discription = _discription.text.toString();
                  var amount = _amount.text.toString();
                  var datetime = _date.text.toString();
                  var radio = select.toString();


                  DatabaseHelper obj = new DatabaseHelper();
                  obj.savedata(title,discription,amount,datetime,radio,widget.id);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViewProduct()));


                  print(title);
                  print(discription);
                  print(amount);
                  print(datetime);
                  print(radio);


                },
                child: Text("SUBMIT")
            ),

          ],
        ),
      ),
    );
  }
}
