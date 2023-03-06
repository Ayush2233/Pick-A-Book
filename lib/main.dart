import 'screens/Home.dart';
import 'screens/Sign up.dart';
import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Search.dart';

void main()
{
  runApp(MaterialApp(
    home: Search(),
    // routes:
    // {
    //   "/" :(context)=> Home(),
    //   "/signup":(context)=>SignUp(),
    //   "/Search":(context)=>Search(),
    //
    // },
    debugShowCheckedModeBanner: false,
  ));
}