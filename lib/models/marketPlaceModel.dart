// To parse this JSON data, do
//
//     final marketPlaceModel = marketPlaceModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MarketPlaceModel marketPlaceModelFromJson(String str) => MarketPlaceModel.fromJson(json.decode(str));

String marketPlaceModelToJson(MarketPlaceModel data) => json.encode(data.toJson());

class MarketPlaceModel {
    MarketPlaceModel({
        required this.id,
        required this.uid,
        required this.bookId,
        required this.title,
        required this.bookDescription,
        required this.coverPage,
        required this.authorName,
        required this.user,
    });

    ObjectId id;
    String uid;
    int bookId;
    String title;
    String bookDescription;
    String coverPage;
    String authorName;
    List user;

    factory MarketPlaceModel.fromJson(Map<String, dynamic> json) => MarketPlaceModel(
        id: json["_id"],
        uid: json["uid"],
        bookId: json["book_id"],
        title: json["title"],
        bookDescription: json["book_description"],
        coverPage: json["cover_page"],
        authorName: json["author_name"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "book_id": bookId,
        "title": title,
        "book_description": bookDescription,
        "cover_page": coverPage,
        "author_name": authorName,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class User {
    User({
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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
