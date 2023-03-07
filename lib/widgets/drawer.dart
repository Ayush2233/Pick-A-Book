import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/data.dart';

Widget custDrawer()
{
  return Drawer(
    child: Column(

      children: 
      [
        SizedBox(height: 30,),

        //BACK BUTTON AND HEAD
        Row(children:
        [
          //BACK BUTTON
          Container(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),)),

          Container(margin:EdgeInsets.only(left: 80),child: Text("Profile",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w600),),)

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
            CircleAvatar(radius: 70,child: Image.network(userimage,fit: BoxFit.cover,),),
            //USERNAME
            Text("$username",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.bold),),
            //EMAIL
            Text("$email"),
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
                ListTile(leading: Icon(Icons.person_outline,color: Colors.black,),title: Text("Edit Profile"),),

                // SIGNOUT BUTTON
                ListTile(leading: Icon(Icons.logout_outlined,color: Colors.black,),title: Text("Sign Out"),),
                // ListTile(leading: Switch(value: value, onChanged: ()=>{}),title: Text("Sign Out"),),
              ],
          ),
        ),

      ],
    ),

  );
}