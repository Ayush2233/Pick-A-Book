import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/book_model.dart';
import 'package:bottom_sheet/bottom_sheet.dart';


class bookdetails
{
  Bookmap data;
  bookdetails({required this.data});

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
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 30),

              // IMAGE
              Center(
                child: Container(
                  child:Image.network(
                      "${data.coverPage}"),
                  width: 130,
                ),
              ),

              SizedBox(height: 25),

              //GENRE
              Container(
                decoration: BoxDecoration(color: Color(0xffDE6077), borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),

                child: Text("${data.genre}",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),

              //TITLE
              Center(
                child: Text(
                  "${data.title}",
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

  void bottomup(BuildContext context)
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
}


