import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:sqflite3/ViewProduct.dart';
import 'package:sqflite3/helper/DatabaseHelper.dart';

class AddProduct extends StatefulWidget {


  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var select = "income";

  TextEditingController _title = TextEditingController();
  TextEditingController _discription = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddProduct"),
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
        // DateTimePicker(
        //   controller: _date,
        //   type: DateTimePickerType.dateTimeSeparate,
        //   dateMask: 'd MMM, yyyy',
        //   initialValue: DateTime.now().toString(),
        //   firstDate: DateTime(2000),
        //   lastDate: DateTime(2100),
        //   icon: Icon(Icons.event),
        //   dateLabelText: 'Date',
        //   timeLabelText: "Hour",
        //   selectableDayPredicate: (date) {
        //     // Disable weekend days to select from the calendar
        //     if (date.weekday == 6 || date.weekday == 7) {
        //       return false;
        //     }
        //
        //     return true;
        //   },
        //   onChanged: (val) => print(val),
        //   validator: (val) {
        //     print(val);
        //     return null;
        //   },
        //   onSaved: (val) => print(val),
        // ),
           ElevatedButton(
               onPressed: (){

                 var title = _title.text.toString();
                 var discription = _discription.text.toString();
                 var amount = _amount.text.toString();
                 var datetime = _date.text.toString();
                 var radio = select.toString();


                 DatabaseHelper obj = new DatabaseHelper();
                 var id =  obj.addproduct(title,discription,amount,datetime,radio);
                 print("id :"+ id.toString());
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (context)=>ViewProduct()));
                 // print("addproduct");

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
