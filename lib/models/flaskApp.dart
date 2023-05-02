import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future recommendBook(var a) async {
  var client = http.Client();
  var uri = Uri.parse("http://192.168.0.108:5050/recommend");
  Map<String, String> headers = {"Content-type": "application/json"};
  String jsonString = json.encode(a);
  try {
    var resp = await client.post(uri, headers: headers, body: jsonString);
    //var resp=await http.get(Uri.parse("http://192.168.1.101:5000"));
    if (resp.statusCode == 200) {
      print("DATA FETCHED SUCCESSFULLY");
      var result = json.decode(resp.body);
      print(result);
      return result;
    }
  }
  catch (e) {
    throw e;
  }
}