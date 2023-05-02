import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/widgets/bookshelf.dart';
import 'package:project2/widgets/homeslider.dart';
import 'package:project2/models/connection.dart';

import '../models/flaskApp.dart';





class Home extends StatefulWidget {
  final Usermap userdetails;
  const Home({required this.userdetails,Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  // final GlobalKey _first = GlobalKey();
  var ratinglist;
  var recData;
  @override
  void initState() {
    ratinglist = MongoDatabase.fetchRecommendation();
    print(FirebaseAuth.instance.currentUser?.uid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //
    // void addToWishList(int bookId){
    //   widget.userdetails.bookId!.add(bookId);
    // }
    //



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
                carouselslider(MongoDatabase.fetchnewbooks()),
                carouselslider(MongoDatabase.fetchtrendbooks()),
              ]
              ),
            ),

          // SizedBox(height: 10,),
          
          //  RECOMMENDED FOR YOU
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: [
                    Text("Recommended for you",
                      style:GoogleFonts.montserrat(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        )),
                    SizedBox(width: 75,),

                    FutureBuilder(
                        future: ratinglist,
                        builder: (context, AsyncSnapshot snapshot){
                          if( snapshot.hasData){
                            return IconButton(onPressed: (){
                              var x= recommendBook(snapshot.data);
                              setState(() {
                                recData= x;
                              });
                            }, icon: Icon(Icons.auto_fix_high));
                          }
                          else{
                            return IconButton(onPressed: (){}, icon:Icon(Icons.disabled_by_default));
                          }

                        }),
                  ],
                ),
              ),),
          SizedBox(height: 10,),

          //  BOOKSHELF
          //   FutureBuilder(
          //       future: ratinglist,
          //       builder: (context, AsyncSnapshot snapshot){
          //         if( snapshot.hasData){
                    bookshelf(recData,MongoDatabase.fetchtopratedbooks()),
                //   }
                //   else{
                //     return Text("hello");
                //   }
                //
                // }),

            SizedBox(height: 25,),


            //HORIZONTAL GRID

            //Fantasy
            Row(children: [SizedBox(width: 30,),
              Text("Fantastic Fantasies",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchfantasybooks()),

            SizedBox(height: 20,),


            //Comic World
            Row(children: [SizedBox(width: 30,),
              Text('Comic World',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchComicbooks()),

            SizedBox(height: 20,),

            //Romance
            Row(children: [SizedBox(width: 30,),
              Text("Top Romance Novels",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchRomancebooks()),

            SizedBox(height: 20,),


            //MARVEL
            Row(children: [SizedBox(width: 30,),
              Text('Explore the World of Marvel',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchmarvelbooks()),

            SizedBox(height: 20,),


            //Young Adult
            Row(children: [SizedBox(width: 30,),
              Text('Young Adult',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchYoungadultbooks()),

            SizedBox(height: 20,),


            Row(children: [SizedBox(width: 30,),
              Text('From Scolastic Inc.',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchscholasticbooks()),

            SizedBox(height: 20,),


            //Best Children's Books
            Row(children: [SizedBox(width: 30,),
              Text("Best Children's Books",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color,),),],),

            SizedBox(height: 20,),

            futureslider(MongoDatabase.fetchChildrenbooks()),

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}



