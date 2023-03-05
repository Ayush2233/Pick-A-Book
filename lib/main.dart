import 'screens/Home.dart';
import 'screens/sign up.dart';
import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/sign up.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(MaterialApp(

    // home: Home(),
    routes:
    {
      "/" :(context)=> Home(),
      "/signup":(context)=>SignUp(),
    },
    debugShowCheckedModeBanner: false,
  ));
}