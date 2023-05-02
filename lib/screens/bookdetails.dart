// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/book_model.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project2/models/connection.dart';
import '../models/RrecBookModel.dart';


class bookdetails
{
  Bookmap data;
  bookdetails({required this.data});
  double? _ratingValue;


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
                  isliked?Icons.favorite:Icons.favorite_outline,
                  color: isliked?Colors.yellowAccent:Colors.white,

                );
                
              },
                onTap: (isliked) async
              {
                var success = await MongoDatabase.updateWishList(data.bookId);

                /// if failed, you can do nothing
                return !isliked;
              }
            ),
          ),

          //Already read Button

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LikeButton(
              likeBuilder: (isliked)
              {
                return Icon(
                  Icons.checklist,
                  color: isliked?Colors.yellowAccent:Colors.white,

                );
              },
              onTap: (isLiked) async{
                // var success = await MongoDatabase.updateRating(data.bookId, 4.5);
                return !isLiked;
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
                child: Stack(
                  children: [
                    Image.network("${data.coverPage}",fit: BoxFit.cover,),
                    Positioned(
                      width: 45,
                        bottom: 1,right: 1,
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          child: Icon(Icons.star_rate,color: Colors.yellow,),

                          onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(

                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

                                content: StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState){

                                    return Container(
                                      height: 250,
                                      child: Column(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,40,0,0),
                                            child: Text("Rate This Book",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Theme.of(context).textTheme.titleLarge?.color
                                            ),),
                                          ),

                                          SizedBox(height: 40,),

                                          RatingBar(
                                              initialRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(Icons.star, color: Colors.orange),
                                                  half: const Icon(
                                                    Icons.star_half,
                                                    color: Colors.orange,
                                                  ),
                                                  empty: const Icon(
                                                    Icons.star_outline,
                                                    color: Colors.orange,
                                                  )),
                                              onRatingUpdate: (value) {
                                                setState(() {
                                                  _ratingValue = value;
                                                });
                                              }),
                                          SizedBox(height: 50,),

                                          ElevatedButton(onPressed: ()async {
                                            await MongoDatabase.updateRating(data.bookId, _ratingValue!);
                                            Navigator.of(context).pop();
                                          },
                                            child: Text("Submit",
                                            style: TextStyle(
                                            color: Colors.white
                                          ),),
                                            style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context).primaryColor
                                          ),)
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            });
                          },
                        )
                    ),
                  ],

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

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
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

                        SizedBox(width: 173,),

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


class bookdetails_recom
{
  Bookmap1 data;
  bookdetails_recom({required this.data});
  double? _ratingValue;

  Widget _bottomsliders(BuildContext context,ScrollController scrollcontroller,double bottomsheetoffset)
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
                    isliked?Icons.favorite:Icons.favorite_outline,
                    color: isliked?Colors.yellowAccent:Colors.white,

                  );

                },
                onTap: (isliked) async
                {
                  var success = await MongoDatabase.updateWishList(data.bookId);

                  /// if failed, you can do nothing
                  return !isliked;
                }
            ),
          ),

          //Already read Button

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LikeButton(
              likeBuilder: (isliked)
              {
                return Icon(
                  Icons.checklist,
                  color: isliked?Colors.yellowAccent:Colors.white,

                );
              },
              onTap: (isLiked) async{
                // var success = await MongoDatabase.updateRating(data.bookId, 4.5);
                return !isLiked;
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
                child: Stack(
                  children: [
                    Image.network("${data.coverPage}",fit: BoxFit.cover,),
                    Positioned(
                        width: 45,
                        bottom: 1,right: 1,
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              )
                          ),
                          child: Icon(Icons.star_rate,color: Colors.yellow,),

                          onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(

                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

                                content: StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState){

                                    return Container(
                                      height: 250,
                                      child: Column(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,40,0,0),
                                            child: Text("Rate This Book",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context).textTheme.titleLarge?.color
                                              ),),
                                          ),

                                          SizedBox(height: 40,),

                                          RatingBar(
                                              initialRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                  full: const Icon(Icons.star, color: Colors.orange),
                                                  half: const Icon(
                                                    Icons.star_half,
                                                    color: Colors.orange,
                                                  ),
                                                  empty: const Icon(
                                                    Icons.star_outline,
                                                    color: Colors.orange,
                                                  )),
                                              onRatingUpdate: (value) {
                                                setState(() {
                                                  _ratingValue = value;
                                                });
                                              }),
                                          SizedBox(height: 50,),

                                          ElevatedButton(onPressed: ()async {
                                            await MongoDatabase.updateRating(data.bookId, _ratingValue!);
                                            Navigator.of(context).pop();
                                          },
                                            child: Text("Submit",
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Theme.of(context).primaryColor
                                            ),)
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            });
                          },
                        )
                    ),
                  ],

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
      builder: _bottomsliders,);
  }

}


