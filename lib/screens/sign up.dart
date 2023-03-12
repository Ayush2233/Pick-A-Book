import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

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

  bool confirm() {
    if (_password.text.trim() == _confirm.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future sign_up() async {
    if (confirm()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(

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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      primary: Color(0xFFedc6cd),
                      shadowColor: Colors.black,
                      elevation: 5),
                  onPressed: sign_up,
                  child: Text('Sign Up',
                    style: TextStyle(
                        color: Colors.black,
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
                          child: Text('Sign up',style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.w500),),

                        )
                      ],
                    ),

                ),




          ],
        ),
      ),

    );
  }
}
