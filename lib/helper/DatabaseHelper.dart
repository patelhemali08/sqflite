import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite3/ViewProduct.dart';


class DatabaseHelper{
     late Database db;
  Future<Database>crate_db()async
  {
     if(db!=null)
     {
       return db;
     }
     else
       {
         Directory dir = await getApplicationDocumentsDirectory();
         String path = join(dir.path,"data_db");
         var db = await openDatabase(path,version: 1,onCreate: create_table);
         return db;
       }
  }

  create_table(Database db , int version)
  {
    db.execute("create table product(pid integer  primary key autoincrement,Title text,Description text,Amount double,DateTime double,Radio text)");
    print("table created");
  }
     

  Future<int> addproduct(title,discription,amount,datetime,radio)async{
    var db = await crate_db();
   var id = db.rawInsert("insert into product(Title,Description,Amount,DateTime,Radio)values(?,?,?,?,?)",[title,discription,amount,datetime,radio]);
   return id;
  }
  
 Future<List> ViewProduct()async{
    var db = await crate_db();
    var data =db.rawQuery("select * from product");
    return data;
  }
  
 Future<int> Deleteproduct(id)async{
    var db = await crate_db();
    var status = db.rawDelete("delete from product where pid=?",[id]);
    return status;
    
  }

 Future<List> getsingleproduct(id)async{
    var db = await crate_db();
    var data =db.rawQuery("select * from product where pid=?",[id]);
    return data ;

  }

 Future<int> savedata(title,discription,amount,datetime,radio,id)async{
    var db = await crate_db();
    var id1= db.rawUpdate("update product set Title=?,Description=?,Amount=?,DateTime=?,Radio=? where pid=?",[title,discription,amount,datetime,radio,id]);
    return id1;

  }
 
}
