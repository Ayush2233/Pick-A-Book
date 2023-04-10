import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/screens/sign%20up.dart';
import 'package:project2/utilities/google.dart';
import 'package:project2/utilities/signin_google.dart';


class Login extends StatefulWidget {
  final VoidCallback showSignup;
  const Login({Key? key, required this.showSignup}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _email = TextEditingController();
  final _password = TextEditingController();

  Future signin() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());}

    on FirebaseAuthException catch(e)
    {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("email-already-in-use")));
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong email/password combination")));
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user found with this email")));
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User disabled")));
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Too many requests to log into this account")));
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("error, please try again later")));
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email address is invalid.")));
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login failed. Please try again.")));
          break;
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            // login image container
            Container(
              height: 300,child: Padding(
              padding: const EdgeInsets.fromLTRB(0,50,0,0),
              child: Column(children: [Image.asset('assets/images/login image.png'),SizedBox(height: 20,),
                Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)],
              ),
            ),
            ),


            // Text field container
            Container(height: 180,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30,0,30,0),
                child: Column(children: [

                  SizedBox(width: 350,child: TextField(controller: _email,
                    decoration: InputDecoration(
                      filled: true,fillColor: Color(0xFFf3f3f3),prefixIcon: Icon(Icons.email_outlined),labelText: 'Email',border: InputBorder.none,),
                  )
                  ),

                  SizedBox(height: 15,),

                  SizedBox(width: 350,child: TextField(controller: _password, obscureText: true,
                    decoration: InputDecoration(
                      filled: true,fillColor: Color(0xFFf3f3f3),suffixIcon: Icon(CupertinoIcons.eye_slash_fill),prefixIcon: Icon(CupertinoIcons.lock),labelText: 'Password',border: InputBorder.none,),
                  )
                  ),
                  SizedBox(height: 15,),

                ],
                ),
              ),
            ),


            //Signin button container

            Container(height: 60,child: SizedBox(width: 350,
              child:
              ElevatedButton(
                 onPressed: ()
                 {
                   signin();},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      side: BorderSide(color: Colors.pink,width: 2),
                      backgroundColor: Colors.pink
                    // primary: Color(0xFFedc6cd),
                    // shadowColor: Colors.black,
                    // elevation: 5
                  ),
                  child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
            ),

            SizedBox(height: 15,),





            SizedBox(height: 20,),



            //FORGET PASSWORD

            Center(
              child: GestureDetector(
                onTap: (){},
                child: Text('Forget the password ?',style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.w600,fontSize: 15),),
              ),
            ),

            SizedBox(height: 40,),



            //EASY LOGIN

            // CONTINUE TEXT
            Container(child:
              Column(children: [
                Center(child: Text('------------ or continue with ------------'
                ,style: TextStyle(fontSize: 15),),),

                SizedBox(height: 30,),


                //EASY LOGIN BUTTONS
                Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    //FACEBOOK
                    SizedBox(width: 80,height: 50,
                      child: OutlinedButton(onPressed: (){}, child: Icon(Icons.facebook),
                        style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                    )

                    //GOOGLE
                    ,SizedBox(width: 80,height: 50,
                      child: OutlinedButton(onPressed: () async {
                        bool user = await isFirstTimeGoogleSignIn();
                        if (user) {
                          setState(() {
                            sign = true;
                          });
                        } else {
                          setState(() {
                            sign = false;
                          });
                        }
                        }, child: Image.asset('assets/icons/google.png',width: 20,),
                        style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                    )

                    //TWITTER
                    ,SizedBox(width: 80,height: 50,
                      child: OutlinedButton(onPressed: (){}, child: Image.asset('assets/icons/twitter (1).png',width: 20,),
                        style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                    )
                  ],),
                ),

                SizedBox(height: 40,),


                //// Signup button
                Center(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(100,0,0,0),
                      child: Row(
                        children: [
                          Text("Don't have an account? ", style: TextStyle(
                              color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
                          ),
                          ),
                          GestureDetector(
                            onTap: widget.showSignup,
                            child: Text('Sign up',style: TextStyle(
                              color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.w500
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
            //Container()
          ],
        ),
      ),
    );
  }
}
