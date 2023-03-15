import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/constants.dart';


class MongoDatabase{

  static var db , userCollection;

  static connect() async{
    db = await Db.create(Mongo_url);
    await db.open();
    inspect(db);
    userCollection = db.collection(book_collection);

  }

}