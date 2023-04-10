import 'package:mongo_dart/mongo_dart.dart' as M;

import 'connection.dart';
import 'user_model.dart';
import 'post_model.dart';

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

Future <void> insertPost(String uid , String image , String caption) async{
  var _id = M.ObjectId();
  final data = PostDisplay(
      id: _id,
      uid: uid,
      caption: caption,
      image: image,
  );
  var results = await MongoDatabase.addPost(data);
}