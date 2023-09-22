import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sqflite3/UpdateProduct.dart';
import 'package:sqflite3/helper/DatabaseHelper.dart';

class ViewProduct extends StatefulWidget {


  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  var position = 0;

  late Future<List>alldata;
  getdata()async{

    DatabaseHelper obj = DatabaseHelper();
    setState(() {
      alldata = obj.ViewProduct();
      print("alldata :"+alldata.toString());
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

      body:FutureBuilder(
        future: alldata,
        builder:(context, snapshot) {
          if(snapshot.hasData)
          {
            if(snapshot.data!.length<=0)
            {
              return  Center(child: Text("no data"));
            }
            else
              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder: (context, index)
                    {
                      return Container(
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                          color:(snapshot.data![index]["Radio"].toString())=="expance"?Colors.red.shade400:Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(top: 10,right: 10.0,left: 10.0),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title :  "+snapshot.data[index]["Title"].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,),
                            SizedBox(height: 10.0,),

                            Text("Description :  "+snapshot.data[index]["Description"].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,),
                            SizedBox(height: 10.0,),

                            Text("Amount :  "+snapshot.data![index]["Amount"].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,),
                            SizedBox(height: 10.0,),

                            Text("DateTime :  "+snapshot.data[index]["DateTime"].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,),
                            SizedBox(height: 10.0,),

                            Text("Radio :  "+snapshot.data[index]["Radio"].toString(),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,),
                            SizedBox(height: 10.0,),
                         Row(
                           children: [
                             ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                 primary: Colors.red,),
                                 onPressed: (){
                                   AlertDialog alert = AlertDialog(
                                     title: Text("name"),
                                     content: Text("are you sure"),
                                     actions: [
                                       ElevatedButton(
                                           onPressed: (){
                                             var id = snapshot.data[index]["pid"].toString();
                                             print(id);

                                             DatabaseHelper obj = new DatabaseHelper();
                                             obj.Deleteproduct(id);
                                             print("delete product");

                                             Navigator.of(context).pop();
                                             Navigator.of(context).push(
                                               MaterialPageRoute(builder: (context)=>ViewProduct()));
                                           },
                                           child: Text("yes")
                                       ),
                                       ElevatedButton(
                                           onPressed: (){
                                             Navigator.of(context).pop();
                                           },
                                           child: Text("no")
                                       ),

                                     ],
                                   );
                                   showDialog(context: context, builder: (context)
                                   {
                                     return alert;
                                   });
                                 },
                                 child: Text("DELETE")
                             ),
                             SizedBox(width: 30.0,),
                             ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   primary: Colors.green,),
                                 onPressed: (){
                                   var id = snapshot.data![index]["pid"].toString();
                                   print(id);

                                   Navigator.of(context).push(
                                       MaterialPageRoute(builder: (context)=>UpdateProduct(id: id,)));

                                 },
                                 child: Text("UPDATE")
                             ),
                           ],
                         )
                          ],
                        ) ,
                      );
                    }
                );
              }
          }
          else  Center(child:CircularProgressIndicator(),);
        },
      ),
    );
  }
}
