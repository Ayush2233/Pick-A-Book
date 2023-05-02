import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future recommendBook(var a) async {
  var client = http.Client();
  var uri = Uri.parse("http://10.7.10.244:8080/recommend");
  Map<String, String> headers = {"Content-type": "application/json"};
  String jsonString = json.encode(a);
  try {
    var resp = await client.post(uri, headers: headers, body: jsonString);
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