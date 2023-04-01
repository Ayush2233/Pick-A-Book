import 'package:mongo_dart/mongo_dart.dart' as M;

import 'connection.dart';
import 'user_model.dart';

Future<void> insertDB(String uid, String name , String email, int age, String gender) async
{

  var _id = M.ObjectId();
  final data = Usermap(
    id: _id,
    uid: uid,
    name: name,
    email: email,
    age: age,
    gender: gender,
  );
  var results = await MongoDatabase.adduser(data);

}