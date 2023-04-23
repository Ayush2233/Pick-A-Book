// To parse this JSON data, do
//
//     final ratingModel = ratingModelFromJson(jsonString);

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

RatingModel ratingModelFromJson(String str) => RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  RatingModel({
    required this.id,
    required this.uid,
    required this.ratings,
  });

  ObjectId id;
  String uid;
  List<Rating> ratings;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    id: json["_id"],
    uid: json["uid"],
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
  };
}

class Rating {
  Rating({
    required this.bookId,
    required this.rate,
  });

  int bookId;
  double rate;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    bookId: json["book_id"],
    rate: json["rate"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "rate": rate,
  };
}
