import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      child: Column(
        children: [
          // LOGIN IMAGE
          Container(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                children: [
                  //  LOGIN IMAGE
                  // CREATE YOUR ACCOUNT TEXT

                  Image.asset('assets/images/login image.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create Your Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
          ),

          // FORM CONTAINER
          Container(
            height: 400,
            child: Column(
              children: [
                // FORM FOR SIGN UP

                //USERNAME
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
                  height: 15,
                ),

                //AGE AND GENDER
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 30, 0),
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 145,
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
                        SizedBox(
                          width: 47,
                        ),
                        SizedBox(
                          width: 145,
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
                ),

                SizedBox(
                  height: 15,
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
                  height: 15,
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
                  height: 15,
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

          // SIGN UP BUTTON
          Container(
            height: 60,
            child: SizedBox(
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      primary: Color(0xFFedc6cd),
                      shadowColor: Colors.black,
                      elevation: 8),
                  onPressed: sign_up,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          // GestureDetector(
          //   onTap: widget.showLogin,
          //   child: Text("Already a user? Signin ",
          //   style: TextStyle(
          //       color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold
          //   ),),
          // ),
        ],
      ),
    ));
  }
}
