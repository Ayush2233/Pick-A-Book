import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/screens/completeProfile.dart';
import 'package:project2/utilities/check.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;



bool sign =false;

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

  // final _user=FirebaseAuth.instance.currentUser;
  bool success = false;
  bool passwordVisible = true;
  bool confirmpass= true;


  bool confirm() {
    if (_password.text.trim() == _confirm.text.trim()) {
      return true;
    } else {
      return false;
    }
  }


  Future sign_up() async {
    if (confirm()) {
      try {
        // Auth User
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim());
        // print('success');
        // User? _user = FirebaseAuth.instance.currentUser;
        // print(_user?.uid);
      }catch(e){
        print(e);
      }
    }
  }


  signupfunc() async
  {
    await sign_up();
    setState(() {
      sign=true;
    });
    // final user = FirebaseAuth.instance.currentUser;
    // String? uid = user?.uid;

    // await insertDB(uid!, _name.text.trim(), _email.text.trim(), int.parse(_age.text.trim()), _gender.text.trim());

  }


  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    // _controller.dispose();
    super.dispose();
  }



  Widget build(BuildContext context) {

    return
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
                    ],
                  ),
                ),

                // FORM CONTAINER

                Container(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


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
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFf3f3f3),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    if(passwordVisible){
                                      passwordVisible = false;
                                    }else{
                                      passwordVisible = true;
                                    }
                                  });
                                },
                                icon: Icon(passwordVisible?CupertinoIcons.eye_slash_fill:CupertinoIcons.eye),
                              ),
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
                            obscureText: confirmpass,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFf3f3f3),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    if(confirmpass){ //if passenable == true, make it false
                                      confirmpass = false;
                                    }else{
                                      confirmpass = true; //if passenable == false, make it true
                                    }
                                  });
                                },
                                icon: Icon(confirmpass?CupertinoIcons.eye_slash_fill:CupertinoIcons.eye),
                              ),
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

                SizedBox(height: 30,),


              ],
            ),
          ),

        );




  }
}
