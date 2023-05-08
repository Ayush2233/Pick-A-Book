

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'sign up.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';


class completeProfile extends StatefulWidget {
  const completeProfile({Key? key}) : super(key: key);

  @override

  State<completeProfile> createState() => _completeProfileState();
}

class _completeProfileState extends State<completeProfile> {

  final _name = TextEditingController();
  final _age = TextEditingController();
  final _gender = SingleValueDropDownController();
  final user = FirebaseAuth.instance.currentUser!;
  String? _chosenValue;



  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _gender.dispose();
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

                  Text('Complete Your Profile',
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
                            keyboardType: TextInputType.number,
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
                          height: 55,
                          child:
                          Container(
                            color: Color(0xFFf3f3f3),
                            child: Row(
                              children: [Icon(Icons.male_outlined),

                                SizedBox(width: 20,),

                                DropdownButton<String>(

                                  value: _chosenValue,
                                  iconEnabledColor:Colors.black,
                                  dropdownColor: Colors.white,
                                  items: <String>[
                                    'Male',
                                    'Female',
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(

                                      value: value,
                                      child: Text(value,style:TextStyle(color:Colors.black),),
                                    );
                                  }).toList(),

                                  hint:Text(
                                    "Gender",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _chosenValue = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),


                        ),
                      ],
                    ),
                  ),

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

                  onPressed:()
                  {
                    insertDB(user.uid.toString(), _name.text.trim(),
                        user.email.toString(), int.parse(_age.text.trim()),
                        _chosenValue!);
                    insertUserForRating(user.uid.toString());    
                    setState(() {
                      sign=false;
                    });
                    FirebaseAuth.instance.currentUser?.reload();

                  },
                  child: Text('Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),

            SizedBox(height: 20,),

            Center(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?", style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),

                  GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.currentUser!.delete();
                      setState(() {
                        sign = false;
                      });
                      },
                    child: Text(' Go back',style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.w500),),

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


