import 'package:flutter/material.dart';
import 'package:project2/screens/Home.dart';
import 'package:project2/screens/completeProfile.dart';
import 'package:project2/screens/sign%20up.dart';
import 'package:project2/screens/signin.dart';

class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {

  bool showLogin = true;

  void toogle(){
    setState(() {
      showLogin =! showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLogin){
      return Login(showSignup: toogle);
    }
    else{
      return SignUp(showLogin: toogle);

    }
  }
}
