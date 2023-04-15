import "package:mongo_dart/mongo_dart.dart";
import 'dart:convert';

Sellmodel sellmodelFromJson(String str) => Sellmodel.fromJson(json.decode(str));

String sellmodelToJson(Sellmodel data) => json.encode(data.toJson());

class Sellmodel {
  Sellmodel({
    required this.id,
    required this.uid,
    required this.bookId,
  });

  ObjectId id;
  String uid;
  int bookId;

  factory Sellmodel.fromJson(Map<String, dynamic> json) => Sellmodel(
    id: json["_id"],
    uid: json["uid"],
    bookId: json["book_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "book_id": bookId,
  };
}
