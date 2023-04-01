import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

Bookmap bookmapFromJson(String str) => Bookmap.fromJson(json.decode(str));

String bookmapToJson(Bookmap data) => json.encode(data.toJson());

class Bookmap {
  Bookmap({
    required this.id,
    required this.bookId,
    required this.title,
    required this.description,
    required this.publicationYear,
    required this.publisher,
    required this.bookAverageRating,
    required this.coverPage,
    required this.genre,
    required this.author,

  });

  ObjectId id;
  int bookId;
  String title;
  String description;
  int publicationYear;
  String publisher;
  // int ratingcount;
  double bookAverageRating;
  String coverPage;
  String genre;
  String author;


  factory Bookmap.fromJson(Map<String, dynamic> json) => Bookmap(
    id: json["_id"],
    bookId: json["book_id"],
    title: json["title"],
    description: json["book_description"],
    publicationYear: json["publication_year"],
    publisher: json["publisher"],
    // ratingcount: json["ratings_count"],
    bookAverageRating: json["book_average_rating"]?.toDouble(),
    coverPage: json["cover_page"],
    genre: json["genre"],
    author: json["author_name"],

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "book_id": bookId,
    "title": title,
    "book_description": description,
    "publication_year": publicationYear,
    "publisher": publisher,
    // "ratings_count": ratingcount,
    "book_average_rating": bookAverageRating,
    "cover_page": coverPage,
    "genre": genre,
    "author_name": author,

  };
}
