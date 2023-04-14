import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:project2/utilities/appstartnotifier.dart';
import '../models/data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/sign up.dart';

Widget returndrawer(Usermap x,BuildContext context){
  return Drawer(
    backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
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
                }, icon: Icon(Icons.arrow_back,color: Theme.of(context).textTheme.titleLarge?.color,),));
              }
          ),

          Container(margin: EdgeInsets.only(left: 80),
            child: Text("Profile", style: GoogleFonts.montserrat(
                color: Theme.of(context).textTheme.titleLarge?.color,
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
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontSize: 18, fontWeight: FontWeight.bold),),
              //EMAIL
              Text("${x.email}",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color),),
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
                color: Theme.of(context).textTheme.titleLarge?.color,), title: Text("Edit Profile",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color),),),

              // SIGNOUT BUTTON
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  sign = false;
                },
                leading: Icon(Icons.logout_outlined,
                  color:Theme.of(context).textTheme.titleLarge?.color,),
                title: Text("Sign Out",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color),),),

                ListTile(leading: Switch(
                  value: Provider.of<AppStateNotifier>(context,listen: false).isDarkModeon,
                  onChanged: (boolVal) {
                    Provider.of<AppStateNotifier>(context,listen: false).updateTheme(boolVal);
                  },
                ),
                  title: Text("Theme",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color),),),


            ],
          ),
        ),

      ],
    ),

  );

}