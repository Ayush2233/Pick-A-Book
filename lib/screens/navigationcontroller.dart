import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project2/screens/marketplace.dart';
import 'package:project2/screens/community.dart';
import 'package:project2/screens/bookmark.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:project2/screens/Home.dart';
import 'package:project2/screens/Search.dart';
import 'package:project2/models/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class navcontroller extends StatefulWidget {
  const navcontroller({Key? key}) : super(key: key);

  @override
  State<navcontroller> createState() => _navcontrollerState();
}

class _navcontrollerState extends State<navcontroller> {


  List<Widget> navlist = [Home(),Search(),community(),bookmark(),marketplace()];
  int currentindex=0;

  final user = FirebaseAuth.instance.currentUser!;

  void _onItemTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,
        actions:
        [
          Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: (){Scaffold.of(context).openEndDrawer();},
                  child: CircleAvatar(backgroundImage:NetworkImage(userimage),radius: 20,),
                ),
              );
            }
          )
        ],

      ),

      bottomNavigationBar: ConvexAppBar(

        height: 55,
        top: -15,
        curveSize: 60,
        style: TabStyle.react,
        onTap: _onItemTapped,
        // activeColor: Colors.red,
        initialActiveIndex: currentindex,
        backgroundColor: Colors.white,
        // shadowColor: Color(0xffCCC1F8),

        items: [

          TabItem(icon: Image.asset('assets/icons/home1.png')),

          TabItem(icon: Image.asset('assets/icons/search1.png')),

          TabItem(icon: Image.asset('assets/icons/group1.png')),

          TabItem(icon: Image.asset('assets/icons/bookmark1.png')),

          TabItem(icon: Image.asset('assets/icons/shopping-bag1.png')),
        ],

      ),

      endDrawer: Drawer(
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
                  return Container(child: IconButton(onPressed: (){Scaffold.of(context).closeEndDrawer();}, icon: Icon(Icons.arrow_back),));
                }
              ),

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
                  CircleAvatar(radius: 70,backgroundImage: NetworkImage(userimage,)),
                  //USERNAME
                  Text("$username",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.bold),),
                  //EMAIL
                  Text(user.email!),
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
                  ListTile(
                    onTap:(){FirebaseAuth.instance.signOut();},
                    leading: Icon(Icons.logout_outlined,color: Colors.black,),
                    title: Text("Sign Out"),),


                ],
              ),
            ),

          ],
        ),

      ),

      body: navlist.elementAt(currentindex),
    );
  }
}
