// To parse this JSON data, do
//
//     final buyModel = buyModelFromJson(jsonString);
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

BuyModel buyModelFromJson(String str) => BuyModel.fromJson(json.decode(str));

String buyModelToJson(BuyModel data) => json.encode(data.toJson());

class BuyModel {
    BuyModel({
        required this.id,
        required this.uid,
        required this.bookId,
        required this.user,
        required this.books,
    });

    ObjectId id;
    String uid;
    int bookId;
    List user;
    List books;

    factory BuyModel.fromJson(Map<String, dynamic> json) => BuyModel(
        id: json["_id"],
        uid: json["uid"],
        bookId: json["book_id"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "book_id": bookId,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
}

class Book {
    Book({
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

    factory Book.fromJson(Map<String, dynamic> json) => Book(
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