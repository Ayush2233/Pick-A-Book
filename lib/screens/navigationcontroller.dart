import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:project2/screens/Home.dart';
import 'package:project2/screens/Search.dart';



class navcontroller extends StatefulWidget {
  const navcontroller({Key? key}) : super(key: key);

  @override
  State<navcontroller> createState() => _navcontrollerState();
}

class _navcontrollerState extends State<navcontroller> {


  List<Widget> navlist = [Home(),Search(),Home(),Search(),Home()];
  int currentindex=0;

  void _onItemTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: ConvexAppBar(

        height: 55,
        top: -25,
        curveSize: 75,
        style: TabStyle.react,
        onTap: _onItemTapped,
        initialActiveIndex: currentindex,
        backgroundColor: Colors.white,

        items: [

          TabItem(icon: Image.asset('assets/icons/home.png')),

          TabItem(icon: Image.asset('assets/icons/search.png')),
          TabItem(icon: Image.asset('assets/icons/group24.png')),

          // TabItem(
          //     icon: Container(
          //
          //       decoration: BoxDecoration(
          //         boxShadow:
          //         [
          //           BoxShadow(color: Color(0xffC9BCF8),blurRadius: 12,spreadRadius: 3,offset: Offset(0,5))
          //         ],
          //         shape: BoxShape.circle,
          //         color: Color(0xffDE6077),
          //       ),
          //
          //       child: Image.asset('assets/icons/group24.png'),
          //
          //     )),

          TabItem(icon: Image.asset('assets/icons/ribbon.png')),

          TabItem(icon: Image.asset('assets/icons/shopping-bag.png')),
        ],

      ),

      body: navlist.elementAt(currentindex),
    );
  }
}
