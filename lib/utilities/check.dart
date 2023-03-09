import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/auth.dart';
import 'package:project2/screens/Home.dart';
import 'package:project2/screens/signin.dart';


class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Home();
        }
        else{
          return Authpage();
        }
      },),
    );
  }
}
