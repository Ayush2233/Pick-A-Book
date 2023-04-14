// ignore_for_file: camel_case_types

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

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(

        // backgroundColor: Colors.black,
        backgroundColor: Theme.of(context).textTheme.titleSmall?.color,
        elevation: 0,
        actions:
        [
          //Bookmark Button

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

          //Already read Button

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

              SizedBox(height: 15),

              // IMAGE
              Center(
                child: Container(
                  child:Image.network("${data.coverPage}",fit: BoxFit.cover,),
                  width: 135,
                ),
              ),

              SizedBox(height: 25),

              //GENRE
              Container(
                decoration: BoxDecoration(color: Theme.of(context).textTheme.titleSmall?.color, borderRadius: BorderRadius.all(Radius.circular(20))),
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
                child: Text("${data.title}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.titleLarge?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //AUTHOR
              Center(
                child: Text("${data.author}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.titleLarge?.color,
                    fontSize: 15,
                  ),),
              ),

              SizedBox(height: 35),

              // Rating Box
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).textTheme.titleSmall?.color,
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

                      ], //children
                    ),

                    SizedBox(height: 10),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Container(
                            width: 200,
                            child: Text(
                              "${data.publisher}",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Text(
                                "${data.bookAverageRating}",
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
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "${data.description}",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 25),

                  Text(
                    "Details",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Published Year : ${data.publicationYear} \n"
                        "Publisher : ${data.publisher}",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
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
      isExpand: true,
      maxHeight: 1,
      minHeight: 0,
      initHeight: .9,
      isSafeArea: true,
      builder: _bottomslider,);
  }
}

