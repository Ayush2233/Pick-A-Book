import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: Prod_Details()));

class Prod_Details extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pick-a-book"),
        centerTitle: true,
        backgroundColor: Color(0xffDE6077),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
        child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_add,
                          color: Colors.black,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_added_outlined,
                          color: Colors.black,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                      ),

                    ],
                  ),

                ],
              ),

              SizedBox(height: 30),

              Center(
                child: Container(
                  child:Image.network(
                      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587396413l/52439531.jpg"),
                  width: 130,
                ),
              ),
              SizedBox(height: 25),

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


              Container(
                decoration: BoxDecoration(color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                height: 80,
                width: 350,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          child: Text(
                            "1100",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ], //children
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45),



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
}
