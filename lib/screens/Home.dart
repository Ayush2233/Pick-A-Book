import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/models/data.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/widgets/bookshelf.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/widgets/homeslider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/connection.dart';
import 'bookdetails.dart';
// import 'navigationcontroller.dart';
import 'package:project2/widgets/bookcard.dart';




class Home extends StatefulWidget {
  final Usermap userdetails;
  const Home({required this.userdetails,Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  var fetchnewdata;
  var trendingdata;
  var toprateddata;
  var childrendata;
  var marveldata;
  var Romancedata;
  var comicdata;
  var fantasydata;
  var youngadultdata;
  var scholasticdata;
  var searchdata;


  @override
  void initState() {
    // TODO: implement initState
    // fetchuser();
    fetchnewdata= MongoDatabase.fetchnewbooks();
    trendingdata=MongoDatabase.fetchtrendbooks();
    toprateddata= MongoDatabase.fetchtopratedbooks();
    childrendata= MongoDatabase.fetchChildrenbooks();
    marveldata= MongoDatabase.fetchmarvelbooks();
    Romancedata=MongoDatabase.fetchRomancebooks();
    comicdata=MongoDatabase.fetchComicbooks();
    fantasydata=MongoDatabase.fetchFantbooks();
    youngadultdata=MongoDatabase.fetchYoungadultbooks();
    scholasticdata=MongoDatabase.fetchscholasticbooks();
    // MongoDatabase.fetchwantlist(Fireuser.uid);

    print("INIT DONE");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: darktheme?Colors.white:Colors.black,
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
                  Text("Hi,${widget.userdetails.name}",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.titleMedium?.color,),),

                  SizedBox(height: 5,),

                  Text("Discover Latest Books",
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      ),
                  )
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
                    labelColor: Theme.of(context).textTheme.titleSmall?.color,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(borderSide: BorderSide(color:Theme.of(context).primaryColor,width: 3.5),),
                    unselectedLabelColor: Theme.of(context).textTheme.titleMedium?.color,
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
                carouselslider(fetchnewdata),
                carouselslider(trendingdata),
              ]
              ),
            ),

          // SizedBox(height: 10,),
          
          //  RECOMMENDED FOR YOU
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Recommended for you",
                style:GoogleFonts.montserrat(
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  )),),

          //  BOOKSHELF
            bookshelf(),

            SizedBox(height: 25,),

            //HORIZONTAL GRID

            //TOP RATED
            Row(children: [SizedBox(width: 30,),
              Text('Top Rated',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(toprateddata),

            SizedBox(height: 20,),

            //Fantasy
            Row(children: [SizedBox(width: 30,),
              Text("Fantastic Fantasies",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(fantasydata),

            SizedBox(height: 20,),


            //Comic World
            Row(children: [SizedBox(width: 30,),
              Text('Comic World',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(comicdata),

            SizedBox(height: 20,),

            //Romance
            Row(children: [SizedBox(width: 30,),
              Text("Top Romance Novels",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(Romancedata),

            SizedBox(height: 20,),


            //MARVEL
            Row(children: [SizedBox(width: 30,),
              Text('Explore the World of Marvel',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(marveldata),

            SizedBox(height: 20,),


            //Young Adult
            Row(children: [SizedBox(width: 30,),
              Text('Young Adult',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(youngadultdata),

            SizedBox(height: 20,),


            Row(children: [SizedBox(width: 30,),
              Text('From Scolastic Inc.',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(scholasticdata),

            SizedBox(height: 20,),


            //Best Children's Books
            Row(children: [SizedBox(width: 30,),
              Text("Best Children's Books",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(childrendata),

            SizedBox(height: 20,),





            // futureslider(searchdata),
            //
            // SizedBox(height: 20,),






          ],
        ),
      ),
    );
  }
}



