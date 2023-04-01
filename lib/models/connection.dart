import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/screens/navigationcontroller.dart';

// Connection Constants

const Mongo_url = "mongodb+srv://project2:project2@pickabookdata.es9jtrh.mongodb.net/pickabook?retryWrites=true&w=majority";

// Collections
const userdata = "Users";
const books = "bookdata";




class MongoDatabase{

  static var db, userCollection, bookCollection;

  static connect() async{

    db = await Db.create(Mongo_url);

    await db.open();
    inspect(db);
    bookCollection = db.collection(books);
    userCollection = db.collection(userdata);
  }

  // Functions

  static Future<String> adduser(Usermap data) async{
    try{
      var results = await userCollection.insertOne(data.toJson());
      if(results.isSuccess){
        return "data inserted";
      }
      else{
        return "Something went wrong";
      }
    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchbooks() async
  {
    final result = await bookCollection.find({"book_average_rating":3.5}).toList();
    // print('result '+ result);
    return result;
  }

}

