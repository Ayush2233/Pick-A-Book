import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/models/data.dart';
import 'package:project2/widgets/bookshelf.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/widgets/homeslider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/connection.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  var fetchdata;
  @override
  void initState() {
    // TODO: implement initState
    fetchdata = MongoDatabase.fetchbooks();
    print("INIT DONE");
    print(fetchdata);
    super.initState();
  }

  Widget bookscard(Bookmap data)
  {
    return GestureDetector
      (     child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 160,
            // child: Text('${data.bookAverageRating}'),
            child: Image.network('${data.coverPage}',fit: BoxFit.cover),
        ));
  }


  Widget _bottomslider(BuildContext context,ScrollController scrollcontroller,double bottomsheetoffset)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        // backgroundColor: Colors.black,
        backgroundColor: Color(0xffDE6077),
        elevation: 0,
        actions:
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LikeButton(
              likeBuilder: (isliked)
              {
                return Icon(
                  Icons.bookmark_add,
                  color: isliked?Colors.yellowAccent:Colors.white,

                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LikeButton(
              likeBuilder: (isliked)
              {
                return Icon(
                  Icons.bookmark_added,
                  color: isliked?Colors.yellowAccent:Colors.white,

                );
              },
            ),
          ),



        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
        child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 30),

              // IMAGE
              Center(
                child: Container(
                  child:Image.network(
                      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587396413l/52439531.jpg"),
                  width: 130,
                ),
              ),

              SizedBox(height: 25),

              //GENRE
              Container(
                decoration: BoxDecoration(color: Color(0xffDE6077),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),

                child:
                Text(
                  "Fiction",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),

              //TITLE
              Center(
                child:
                Text(
                  "Inheritance Games",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //AUTHOR
              Center(
                child:
                Text(
                  "Jennifer Lynn Barnes",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),

              SizedBox(height: 35),

              // Rating Box
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                height: 80,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            "Publisher",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Container(
                          child: Text(
                            "Rating",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Container(
                          child: Text(
                            "Likes",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ], //children
                    ),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            "Oxford",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Text(
                                "4 ",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: LikeButton(
                            likeCount: 100,
                            countBuilder: (likecount,isliked,text)
                            {
                              return Text(
                                text,
                                style: TextStyle(
                                  color: isliked?Colors.pinkAccent:Colors.white,
                                  fontSize: 15,
                                ),

                              );
                            },

                          ),
                          // child: Text(
                          //   "1100",
                          //   style: GoogleFonts.montserrat(
                          //     color: Colors.white,
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ),
                      ], //children
                    ),
                  ],
                ),
              ),

              SizedBox(height: 45),

              //BOOK DETAILS
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Introduction",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Avery Grambs has a plan for a better future: "
                        "survive high school, win a scholarship, and get out. But her fortunes...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 25),

                  Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Published Year : 2021 \n"
                        "Language : en \n"
                        "Publisher : Oxford",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  void bottomup()
  {
    showFlexibleBottomSheet(context: context,
        // isScrollControlled: true,
        // anchorPoint: Offset(50,200),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        // enableDrag: true,
        isExpand: true,
        maxHeight: 1,
        minHeight: 0,
        initHeight: .9,
        isSafeArea: true,
        builder: _bottomslider,);
  }


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      // extendBodyBehindAppBar: true,

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

          // SizedBox(height: 10,),
          
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

            SizedBox(height: 25,),
            // bookshelfs(),

            Row(children: [SizedBox(width: 30,),Text('Top Rated',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),),],),

            SizedBox(height: 20,),

            //HORIZONTAL GRID

            Container(height: 150,width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: covers.length,
                  itemBuilder: (context,index){

                    return GestureDetector
                      ( onTap: (){bottomup();},
                        child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 160,
                        child: Image.network(covers[index],fit: BoxFit.cover)));
                  }),
            ),

            SizedBox(height: 20,),

      Container(height: 150,width: double.maxFinite,
        child: FutureBuilder(
            future: fetchdata,
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else{
                if(snapshot.hasData){
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return bookscard(Bookmap.fromJson(snapshot.data[index]));
                      }
                  );
                }
                else{
                  return Center(
                    child: Text('No Data Available'),
                  );
                }
              }
            }
        ),
      )


          ],
        ),
      ),
    );
  }
}



