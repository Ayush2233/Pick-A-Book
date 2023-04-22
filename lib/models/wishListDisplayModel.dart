// To parse this JSON data, do
//
//     final wishListDisplayModel = wishListDisplayModelFromJson(jsonString);

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

WishListDisplayModel wishListDisplayModelFromJson(String str) => WishListDisplayModel.fromJson(json.decode(str));

String wishListDisplayModelToJson(WishListDisplayModel data) => json.encode(data.toJson());

class WishListDisplayModel {
  WishListDisplayModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.wishlist,
    required this.result,
  });

  ObjectId id;
  String uid;
  String name;
  String email;
  int age;
  String gender;
  int wishlist;
  List<Result> result;

  factory WishListDisplayModel.fromJson(Map<String, dynamic> json) => WishListDisplayModel(
    id: json["_id"],
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    age: json["age"],
    gender: json["gender"],
    wishlist: json["wishlist"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "name": name,
    "email": email,
    "age": age,
    "gender": gender,
    "wishlist": wishlist,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.bookId,
    required this.title,
    required this.bookDescription,
    required this.publicationYear,
    required this.publisher,
    required this.ratingsCount,
    required this.bookAverageRating,
    required this.coverPage,
    required this.genre,
    required this.authorName,
    required this.likes,
  });

  ObjectId id;
  int bookId;
  String title;
  String bookDescription;
  int publicationYear;
  String publisher;
  int ratingsCount;
  double bookAverageRating;
  String coverPage;
  String genre;
  String authorName;
  int likes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    bookId: json["book_id"],
    title: json["title"],
    bookDescription: json["book_description"],
    publicationYear: json["publication_year"],
    publisher: json["publisher"],
    ratingsCount: json["ratings_count"],
    bookAverageRating: json["book_average_rating"]?.toDouble(),
    coverPage: json["cover_page"],
    genre: json["genre"],
    authorName: json["author_name"],
    likes: json["likes"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "book_id": bookId,
    "title": title,
    "book_description": bookDescription,
    "publication_year": publicationYear,
    "publisher": publisher,
    "ratings_count": ratingsCount,
    "book_average_rating": bookAverageRating,
    "cover_page": coverPage,
    "genre": genre,
    "author_name": authorName,
    "likes": likes,
  };
}
