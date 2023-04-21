import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:project2/models/postDisplayModel.dart';
import 'sell_model.dart';
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
    wishlist: [1]
  );
  var results = await MongoDatabase.adduser(data);

}

Future <void> insertPost(String uid , String image , String caption, int likes,DateTime time) async{
  var _id = M.ObjectId();
  final data = PostDisplay(
      id: _id,
      uid: uid,
      caption: caption,
      image: image,
      likes: likes,
      time: DateTime.now(),
  );
  var results = await MongoDatabase.addPost(data);
}

Future <void> sellitem(String uid, int bookId , String title , String bookDescription, String coverPage, String authorName) async{
  var _id = M.ObjectId();
  final data = Sellmodel(id: _id, uid: uid, bookId: bookId, title: title, bookDescription: bookDescription, coverPage: coverPage, authorName: authorName);
  var results = await MongoDatabase.sellList(data);
}