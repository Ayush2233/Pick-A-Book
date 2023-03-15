import 'package:firebase_core/firebase_core.dart';
import 'package:project2/models/db_connect.dart';
import 'package:project2/screens/navigationcontroller.dart';
import 'package:project2/screens/signin.dart';
import 'package:project2/utilities/check.dart';
import 'screens/Home.dart';
import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Search.dart';
import 'screens/sign up.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MongoDatabase.connect();

  runApp(MaterialApp(
    home: Check(),
    theme: ThemeData(primarySwatch: Colors.pink,),

    debugShowCheckedModeBanner: false,
  ));
}