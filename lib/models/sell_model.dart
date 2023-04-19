import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Sellmodel sellmodelFromJson(String str) => Sellmodel.fromJson(json.decode(str));

String sellmodelToJson(Sellmodel data) => json.encode(data.toJson());

class Sellmodel {
  Sellmodel({
    required this.id,
    required this.uid,
    required this.bookId,
    required this.title,
    required this.bookDescription,
    required this.coverPage,
    required this.authorName,
  });

  ObjectId id;
  String uid;
  int bookId;
  String title;
  String bookDescription;
  String coverPage;
  String authorName;

  factory Sellmodel.fromJson(Map<String, dynamic> json) => Sellmodel(
    id: json["_id"],
    uid: json["uid"],
    bookId: json["book_id"],
    title: json["title"],
    bookDescription: json["book_description"],
    coverPage: json["cover_page"],
    authorName: json["author_name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "book_id": bookId,
    "title": title,
    "book_description": bookDescription,
    "cover_page": coverPage,
    "author_name": authorName,
  };
}