import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:project2/utilities/check.dart';


class SignUp extends StatefulWidget {
  final VoidCallback showLogin;
  const SignUp({Key? key, required this.showLogin}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _controller = ConfettiController();
  bool success = false;




  bool confirm() {
    if (_password.text.trim() == _confirm.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future sign_up() async {
    if (confirm()) {
      // Auth User
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());

      // Add user
      addUser(_name.text.trim(), _email.text.trim(), int.parse(_age.text.trim()));
      success= true;

      }
  }

  signupfunc() async
  {
    await sign_up();
    if(success=true) {
      _controller.play();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                  title: Text('Success'),
                  content: Text('Sign up Successful'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Ok'),
                      onPressed: () {
                        _controller.stop();
                        Navigator.pop(context);
                        setState(() {
                          success= false;
                        });
                      },
                    ),
                  ],
                );
          });
      // success = false;
    }
  }



  Future addUser(String name , String email , int age) async{
    await FirebaseFirestore.instance.collection('Users').add({
      'name' : name,
      'age' : age,
      'email': email,
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    _name.dispose();
    _age.dispose();
    // _controller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(

              body: SingleChildScrollView(
                // width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // LOGIN IMAGE

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      // color: Colors.red,
                      height: 230,
                      child: Column(
                        children: [
                          Image.asset('assets/images/login image.png',height: 150,),

                          SizedBox(height: 10,),

                          Text('Create Your Account',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],),
                    ),

                    // FORM CONTAINER

                    Container(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //NAME
                          SizedBox(
                              width: 340,
                              child: TextField(
                                controller: _name,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFf3f3f3),
                                  prefixIcon: Icon(CupertinoIcons.profile_circled),
                                  labelText: 'Name',
                                  border: InputBorder.none,
                                ),
                              )),

                          SizedBox(
                            height: 10,
                          ),

                          //AGE AND GENDER
                          Container(
                            width: 340,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // AGE
                                SizedBox(
                                  width: 155,
                                  child: TextField(
                                    controller: _age,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFf3f3f3),
                                        prefixIcon: Icon(
                                          CupertinoIcons.group,
                                          color: Colors.black,
                                        ),
                                        labelText: "Age",
                                        border: InputBorder.none),
                                  ),
                                ),

                                // GENDER
                                SizedBox(
                                  width: 155,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFf3f3f3),
                                        prefixIcon: Icon(Icons.male),
                                        labelText: "Gender",
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          //EMAIL
                          SizedBox(
                              width: 340,
                              child: TextField(
                                controller: _email,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFf3f3f3),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  labelText: 'Email',
                                  border: InputBorder.none,
                                ),
                              )),

                          SizedBox(
                            height: 10,
                          ),

                          //PASSWORD
                          SizedBox(
                              width: 340,
                              child: TextField(
                                controller: _password,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFf3f3f3),
                                  suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
                                  prefixIcon: Icon(CupertinoIcons.lock),
                                  labelText: 'Password',
                                  border: InputBorder.none,
                                ),
                              )),

                          SizedBox(
                            height: 10,
                          ),

                          //CONFIRM PASSWORD
                          SizedBox(
                              width: 340,
                              child: TextField(
                                controller: _confirm,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFf3f3f3),
                                  suffixIcon: Icon(CupertinoIcons.eye_slash_fill),
                                  prefixIcon: Icon(CupertinoIcons.lock),
                                  labelText: 'Confirm Password',
                                  border: InputBorder.none,
                                ),
                              )),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    // SIGN UP BUTTON
                    Container(
                      height: 50,
                      width: 340,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              side: BorderSide(color: Colors.pink,width: 2),
                              backgroundColor: Colors.pink
                              // primary: Color(0xFFedc6cd),
                              // shadowColor: Colors.black,
                              // elevation: 5
                          ),

                          onPressed: signupfunc,
                          child: Text('Sign Up',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),

                    SizedBox(height: 40,),

                    Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account ?", style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),

                                GestureDetector(
                                  onTap: widget.showLogin,
                                  child: Text('Sign in',style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.w500),),

                                )
                              ],
                            ),

                        ),
                  ],
                ),
              ),

            ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: pi/2,
            gravity: .001,
            emissionFrequency: .1,
          ),
        ),
      ],
    );


  }
}
