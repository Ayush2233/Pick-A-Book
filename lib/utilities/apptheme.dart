import 'package:flutter/material.dart';
class ThemeClass{

  static ThemeData lightTheme = ThemeData(

      scaffoldBackgroundColor: Colors.white,

      canvasColor: Colors.black,


      primarySwatch: Colors.pink,
      primaryColor: Colors.pink,

      textTheme: TextTheme(
        titleMedium: TextStyle(color: Color(0xff969696)),
        titleLarge: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Color(0xffDE6077)),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,),

    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: Colors.black)),

      drawerTheme: DrawerThemeData(backgroundColor: Colors.white,),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white,),
  );

  static ThemeData darkTheme = ThemeData(

      scaffoldBackgroundColor: Colors.black,

      canvasColor: Colors.white,

      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple,

      textTheme: TextTheme(
        titleMedium: TextStyle(color: Color(0xff969696)),
        titleLarge: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Color(0xffA594F9)),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),

      drawerTheme: DrawerThemeData(backgroundColor: Colors.black),

      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: Colors.white)),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.black),
  );
}

