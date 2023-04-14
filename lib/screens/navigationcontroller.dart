import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../utilities/appstartnotifier.dart';
import 'sign up.dart';
import 'package:project2/screens/marketplace.dart';
import 'package:project2/screens/community.dart';
import 'package:project2/screens/bookmark.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:project2/screens/Home.dart';
import 'package:project2/screens/Search.dart';
import 'package:project2/models/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
import 'package:project2/models/connection.dart';


class navcontroller extends StatefulWidget {
  const navcontroller({Key? key}) : super(key: key);

  @override
  State<navcontroller> createState() => _navcontrollerState();
}

class _navcontrollerState extends State<navcontroller> {


  var  currentUser;
  var scaffoldcolor;
  var fetchuser;
  var xyz;
  List<Widget> navlist=[Home(),Search(),community(),bookmark(),marketplace()];
  int currentindex=0;


  final user = FirebaseAuth.instance.currentUser!;



  void _onItemTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }


 

  @override
  void initState() {
  fetchuser = MongoDatabase.fetchUserData();

  super.initState();
  }

  @override
  Widget build(BuildContext context) {

    scaffoldcolor = Theme.of(context).scaffoldBackgroundColor;
    bool dark_mode = scaffoldcolor== Color(0xff000000);


    

    return Scaffold(
      // backgroundColor: darktheme?Colors.black:Colors.white,
      appBar: AppBar(

        leading: Container(
          // padding: EdgeInsets.only(left: 10),
          child: Image.asset(dark_mode?'assets/images/logo_dark.png':'assets/images/logo.png',fit: BoxFit.cover,),),
        leadingWidth: 140,
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
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          // shadowColor: Color(0xffCCC1F8),
          items: [

            TabItem(icon: Image.asset(dark_mode?'assets/icons/home_d.png':'assets/icons/home1.png')),

            TabItem(icon: Image.asset(dark_mode?'assets/icons/search_d.png':'assets/icons/search1.png')),

            TabItem(icon: Image.asset(dark_mode?'assets/icons/group_d.png':'assets/icons/group1.png')),

            TabItem(icon: Image.asset(dark_mode?'assets/icons/saved_d.png':'assets/icons/bookmark1.png')),

            TabItem(icon: Image.asset(dark_mode?'assets/icons/shopping-bag_d.png':'assets/icons/shopping-bag1.png')),
          ],
        ),



      endDrawer: FutureBuilder(
        future: fetchuser,
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData)
          {
            return Container(
              child: returndrawer(Usermap.fromJson(snapshot.data),context),
            );
          }
          else{
            return Text("No data");
          }
        }
      ),

      body: navlist.elementAt(currentindex),
    );
  }
}
