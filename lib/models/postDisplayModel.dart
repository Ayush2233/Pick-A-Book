// To parse this JSON data, do
//
//     final postDisplay1 = postDisplay1FromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

PostDisplay1 postDisplay1FromJson(String str) => PostDisplay1.fromJson(json.decode(str));

String postDisplay1ToJson(PostDisplay1 data) => json.encode(data.toJson());

class PostDisplay1 {
  PostDisplay1({
    required this.id,
    required this.uid,
    required this.caption,
    required this.image,
    required this.result,
  });

  ObjectId id;
  String uid;
  String caption;
  String image;
  List<Result> result;

  factory PostDisplay1.fromJson(Map<String, dynamic> json) => PostDisplay1(
    id: json["_id"],
    uid: json["uid"],
    caption: json["caption"],
    image: json["image"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "caption": caption,
    "image": image,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
  });

  ObjectId id;
  String uid;
  String name;
  String email;
  int age;
  String gender;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    age: json["age"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "name": name,
    "email": email,
    "age": age,
    "gender": gender,
  };
}
