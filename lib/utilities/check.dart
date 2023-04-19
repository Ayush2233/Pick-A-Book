import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/screens/completeProfile.dart';
import 'package:project2/screens/sign%20up.dart';
import 'package:project2/utilities/authpage.dart';
import 'package:project2/screens/Home.dart';
import 'package:project2/screens/navigationcontroller.dart';
import 'package:project2/screens/signin.dart';
import 'package:project2/models/connection.dart';


class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    MongoDatabase s;
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData && sign==false){
          return navcontroller();
        }
        if(snapshot.hasData && sign==true){
          return completeProfile();
        }
        else{
          return Authpage();
        }
      },),
    );
  }
}
