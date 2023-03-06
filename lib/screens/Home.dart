import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/Bottomnav.dart';
import 'package:project2/widgets/appbar.dart';
import 'package:project2/widgets/drawer.dart';
import 'package:project2/models/data.dart';
import 'package:project2/widgets/bookshelf.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/widgets/homeslider.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      // extendBodyBehindAppBar: true,

      appBar: custAppbar(),

      bottomNavigationBar:custBottombar(),

      endDrawer: custDrawer(),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children:
          [
            // SizedBox(height: 85,),
            // HELLO USER WELCOME TEXT

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: 
                [
                  Text("Hi,$user",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Color(0xff969696),),),

                  SizedBox(height: 5,),

                  Text("Discover Latest Books",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      ),)
                ],
              ),
            ),

            SizedBox(height:0,),

            //TABS (NEW AND TRENDING)

            Container(
              padding: EdgeInsets.only(left: 20),
              child: Align(

                alignment: Alignment.centerLeft,

                child: TabBar(

                    controller: _tabController,
                    labelColor: Colors.black,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Color(0xffDE6077),width: 3.5),),
                    unselectedLabelColor: Color(0xff969696),
                    tabs:
                    [
                      Tab(text: "New",),
                      Tab(text: "Trending",),
                    ] ),
              ),
            ),

            SizedBox(height: 0,),

            //TAB BAR VIEW (TAB AREAS)
            Container(
              width: double.maxFinite,
              height: 200,
              // color: Colors.black,
              child: TabBarView(
                  controller: _tabController,
                  children:
              [
                homeslidernew(),
                homeslidernew(),
              ]
              ),
            ),

          SizedBox(height: 10,),
          
          //  RECOMMENDED FOR YOU
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Recommended for you",
                style:GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  )),),

          //  BOOKSHELF
            bookshelf(),
            bookshelf(),


          ],
        ),
      ),
    );
  }
}



