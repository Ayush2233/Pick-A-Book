import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

Widget custBottombar()
{
  return ConvexAppBar(
      // disableDefaultTabController: true,
      // initialActiveIndex: 0,
      height: 65,
      top: -30,
      curveSize: 85,
      style: TabStyle.fixedCircle,
      items: [
        TabItem(icon: Image.asset('assets/icons/home.png')),
        TabItem(icon: Image.asset('assets/icons/search.png')),
        TabItem(
            icon: Container(

              decoration: BoxDecoration(
                boxShadow:
                [
                  BoxShadow(color: Color(0xffC9BCF8),blurRadius: 12,spreadRadius: 2,offset: Offset(0,6))
                ],
                shape: BoxShape.circle,
                color: Color(0xffDE6077),
              ),

              child: Image.asset('assets/icons/group24.png'),

            )),

        TabItem(icon: Image.asset('assets/icons/ribbon.png')),

        TabItem(icon: Image.asset('assets/icons/shopping-bag.png')),
      ],

      backgroundColor: Colors.white,
      // cornerRadius: 25,
    );
}

