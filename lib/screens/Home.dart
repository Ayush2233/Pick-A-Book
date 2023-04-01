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
import 'bookdetails.dart';
import 'package:project2/widgets/bookcard.dart';


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

  // Widget bookscard(Bookmap data)
  // {
  //   return GestureDetector
  //
  //     (     onTap: ()
  //             {
  //               var Book= bookdetails(data: data);
  //               Book.bottomup(context);
  //             },
  //           child: Container(
  //           margin: EdgeInsets.only(left: 20),
  //           height: 160,
  //           // child: Text('${data.bookAverageRating}'),
  //           child: Image.network('${data.coverPage}',fit: BoxFit.cover),
  //       ));
  // }



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

            //HORIZONTAL GRID

            Row(children: [SizedBox(width: 30,),Text('Top Rated',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),),],),

            SizedBox(height: 20,),

            Container(height: 150,width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: covers.length,
                  itemBuilder: (context,index){

                    return GestureDetector
                      (
                        child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 160,
                        child: Image.network(covers[index],fit: BoxFit.cover)));
                  }),
            ),

            SizedBox(height: 20,),

            Container(
              height: 150,
              width: double.maxFinite,
              child: FutureBuilder(
                  future: fetchdata,
                  builder: (context, AsyncSnapshot snapshot)
                  {
                    if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return Center(
                        child: CircularProgressIndicator(),);
                    }
                    else
                    {
                      if(snapshot.hasData)
                      {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context,index)
                            {
                              return bookscard(Bookmap.fromJson(snapshot.data[index]),context);
                            }
                            );
                      }
                      else
                      {
                        return Center(child: Text('No Data Available'),);
                      }
                    }
                  }),
            )

          ],
        ),
      ),
    );
  }
}



