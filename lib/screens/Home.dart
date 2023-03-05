import 'package:flutter/material.dart';
import 'package:project2/widgets/Bottomnav.dart';
import 'package:project2/widgets/appbar.dart';
import 'package:project2/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custAppbar(),

      bottomNavigationBar:custBottombar(),

      endDrawer: custDrawer(),
    );
  }
}



