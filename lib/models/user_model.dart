// To parse this JSON data, do
//
//     final usermap = usermapFromJson(jsonString);

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

Usermap usermapFromJson(String str) => Usermap.fromJson(json.decode(str));

String usermapToJson(Usermap data) => json.encode(data.toJson());

class Usermap {
    Usermap({
        required this.id,
        required this.uid,
        required this.name,
        required this.email,
        required this.age,
        required this.gender,
        required this.wishlist,
    });

    ObjectId id;
    String uid;
    String name;
    String email;
    int age;
    String gender;
    List<int> wishlist;

    factory Usermap.fromJson(Map<String, dynamic> json) => Usermap(
        id: json["_id"],
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
        gender: json["gender"],
        wishlist: List<int>.from(json["wishlist"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "name": name,
        "email": email,
        "age": age,
        "gender": gender,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x)),
    };
}
