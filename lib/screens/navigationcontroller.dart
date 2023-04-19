import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/widgets/drawer.dart';
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
import 'package:project2/models/connection.dart';

bool darktheme=false;

class navcontroller extends StatefulWidget {
  const navcontroller({Key? key}) : super(key: key);

  @override
  State<navcontroller> createState() => _navcontrollerState();
}

class _navcontrollerState extends State<navcontroller> {
  var  currentUser;
  var fetchuser;
  var xyz;
  List<Widget> navlist=[Home(),Search(),community(),bookmark(),marketplace()];
  int currentindex=0;


  final user = FirebaseAuth.instance.currentUser!;


  void darkmode()
  {
    setState(() {
      darktheme=!darktheme;
    });
  }

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

    return Scaffold(
      backgroundColor: darktheme?Colors.black:Colors.white,
      appBar: AppBar(

        leading: Container(padding: EdgeInsets.only(left: 10),
          child: Image.asset('assets/images/logo.png'),),
        leadingWidth: 110,
        backgroundColor: Colors.transparent,

        elevation: 0,
        actions:
        [
          IconButton(onPressed: (){darkmode();}, icon: Icon(Icons.dark_mode,color:darktheme?Colors.white:Colors.black,)),
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
        backgroundColor: darktheme?Colors.black:Colors.white,
        // shadowColor: Color(0xffCCC1F8),

        items: [

          TabItem(icon: Image.asset('assets/icons/home1.png')),

          TabItem(icon: Image.asset('assets/icons/search1.png')),

          TabItem(icon: Image.asset('assets/icons/group1.png')),

          TabItem(icon: Image.asset('assets/icons/bookmark1.png')),

          TabItem(icon: Image.asset('assets/icons/shopping-bag1.png')),
        ],

      ),

      endDrawer: FutureBuilder(
        future: fetchuser,
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData)
          {
            return Container(
              child: returndrawer(Usermap.fromJson(snapshot.data)),
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
