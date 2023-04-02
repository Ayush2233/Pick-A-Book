import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/user_model.dart';

import '../models/data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/sign up.dart';

Widget returndrawer(Usermap x){
  return Drawer(
    child: Column(

      children:
      [
        SizedBox(height: 30,),

        //BACK BUTTON AND HEAD
        Row(children:
        [
          //BACK BUTTON
          Builder(
              builder: (context) {
                return Container(child: IconButton(onPressed: () {
                  Scaffold.of(context).closeEndDrawer();
                }, icon: Icon(Icons.arrow_back),));
              }
          ),

          Container(margin: EdgeInsets.only(left: 80),
            child: Text("Profile", style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w600),),)

        ],),

        //PROFILE DETAILS AND IMAGE
        Container(

          height: 230,
          padding: EdgeInsets.only(top: 20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children:
            [
              //IMAGE
              CircleAvatar(radius: 70, backgroundImage: NetworkImage(
                userimage,)),
              //USERNAME
              Text("${x.name}", style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),),
              //EMAIL
              Text("${x.email}"),
            ],
          ),),

        //LISTVIEW LIST OF OPTIONS
        Container(

          height: 400,

          child: ListView
            (
            children:
            [
              //EDIT PROFILE
              ListTile(leading: Icon(Icons.person_outline,
                color: Colors.black,), title: Text("Edit Profile"),),

              // SIGNOUT BUTTON
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  sign = false;
                },
                leading: Icon(Icons.logout_outlined,
                  color: Colors.black,),
                title: Text("Sign Out"),),

                ListTile(leading: Icon(Icons.thermostat,
                color: Colors.black,), title: Text("Theme"),),


            ],
          ),
        ),

      ],
    ),

  );

}