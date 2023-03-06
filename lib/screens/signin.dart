import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

                  SizedBox(width: 350,child: TextField(
                    decoration: InputDecoration(
                      filled: true,fillColor: Color(0xFFf3f3f3),prefixIcon: Icon(Icons.email_outlined),labelText: 'Email',border: InputBorder.none,),
                  )
                  ),

                  SizedBox(height: 15,),

                  SizedBox(width: 350,child: TextField(
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
              child: ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),primary: Color(0xFFedc6cd),shadowColor: Colors.black,elevation: 8),onPressed: () {},
                  child: Text('Sign In',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
            ),

            // Conatiner for google login
            //Container()
          ],
        ),
      ),
    );
  }
}
