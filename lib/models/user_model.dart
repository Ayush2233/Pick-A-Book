import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Usermap mongoInsertFromJson(String str) => Usermap.fromJson(json.decode(str));

String mongoInsertToJson(Usermap data) => json.encode(data.toJson());

class Usermap {
    Usermap({
        required this.id,
        required this.uid,
        required this.name,
        required this.email,
        required this.age,
        required this.gender,
    });

    ObjectId id;
    String? uid;
    String name;
    String email;
    int age;
    String gender;

    factory Usermap.fromJson(Map<String, dynamic> json) => Usermap(
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
