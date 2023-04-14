import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project2/models/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/homeslider.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/book_model.dart';




class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin{

  var toprateddata;
  var childrendata;
  var mysterydata;
  var youngadultdata;
  var fantasydata;
  var comicdata;
  var historydata;
  var romancedata;
  var poetrydata;
  var dynamicFuture;
  var dynamicGrid;
  var searchdata;

  @override

  void initState() {
    // TODO: implement initState

    toprateddata= MongoDatabase.fetchtopratedbooks();
    childrendata= MongoDatabase.fetchChildrenbooks();
    mysterydata= MongoDatabase.fetchMysterybooks();
    youngadultdata= MongoDatabase.fetchYoungadultbooks();
    fantasydata= MongoDatabase.fetchfantasybooks();
    comicdata= MongoDatabase.fetchComicwithMarvelbooks();
    historydata= MongoDatabase.fetchHistorybooks();
    romancedata= MongoDatabase.fetchRomancebooks();
    poetrydata= MongoDatabase.fetchPoetrybooks();
    dynamicFuture=[childrendata,mysterydata,youngadultdata,fantasydata,comicdata,historydata,romancedata,poetrydata];
    dynamicGrid=toprateddata;

    print("search init done");
    super.initState();
  }


  List genrelist =["Children","Mystery","Young Adult","Fantasy","Comic","History","Romance","Poetry"];
  var dynamicText="Top Rated";



  bool isGrid = true;
  @override

  Widget build(BuildContext context) {



    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [

            // SEARCH TEXT FIELD
            Container(height: 55,child: SizedBox(width: 370,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,7,0,0),

                //TEXT FIELD AND ICON
                child: TextField(
                  onChanged:(String x) async
                  {
                    var temp = await MongoDatabase.fetsearch(x);
                    setState(() {
                      searchdata=temp;
                      dynamicGrid=searchdata;
                    });
                  },
                  decoration: InputDecoration(filled: true,fillColor: Color(0xFFf3f3f3),
                      suffixIcon: Icon(CupertinoIcons.search_circle_fill,color: Color(0xFFDE6077),size: 50,),

                      hintText: 'Search Book...',
                      hintStyle: TextStyle(fontSize: 13),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
            ),),

            SizedBox(height: 20,),

            //GENRE BUTTONS
            Container(
            child: Column(
              children: [
                Row(children: [SizedBox(width: 20,),
                  Text('Genre',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),),],),

                SizedBox(height: 20,),
                //ROW 1 - 3 GENRE
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    //CHILDREN
                  SizedBox(width: 115,height: 43,child: OutlinedButton(
                    onPressed: (){setState(() {
                      dynamicText=genrelist[0];
                      dynamicGrid=dynamicFuture[0];
                    });},
                    child: Text('Children',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                    ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),

                  //MYSTERY
                  SizedBox(width: 115,height: 43,child: OutlinedButton(
                    onPressed: () {setState(() {
                      dynamicText=genrelist[1];
                      dynamicGrid=dynamicFuture[1];
                    });},
                    child: Text('Mystery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),

                  //YOUNG ADULT
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {setState(() {
                    dynamicText=genrelist[2];
                    dynamicGrid=dynamicFuture[2];
                  });},
                    child: Text('Young Adult',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),

                ],),

                SizedBox(height: 10,),

                //ROW 2 - GENREE
                Row(
                children: [
                  SizedBox(width: 70,),

                  //FANTASY
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {setState(() {
                    dynamicText=genrelist[3];
                    dynamicGrid=dynamicFuture[3];
                  });},
                    child: Text('Fantasy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                    ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),


                  SizedBox(width: 40,),

                  //COMIC
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {setState(() {
                    dynamicText=genrelist[4];
                    dynamicGrid=dynamicFuture[4];
                  });},
                    child: Text('Comic',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                    ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                ],),

                SizedBox(height: 10,),

                //ROW 3
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    //HISTORY
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {setState(() {
                      dynamicText=genrelist[5];
                      dynamicGrid=dynamicFuture[5];
                    });},
                      child: Text('History',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),

                    //ROMANCE
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {setState(() {
                      dynamicText=genrelist[6];
                      dynamicGrid=dynamicFuture[6];
                    });},
                      child: Text('Romance',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),

                    //POETRY
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {setState(() {
                      dynamicText=genrelist[7];
                      dynamicGrid=dynamicFuture[7];
                    });},
                      child: Text('Poetry',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  ],),

              ],
            ),
            ),

            SizedBox(height: 30,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("$dynamicText",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,20,0),
                child: IconButton(onPressed: ()
                {
                  setState(() {
                    isGrid=!isGrid;
                  });
                },
                    icon: Icon(isGrid?Icons.list:Icons.grid_view)),
              )
            ],),

            SizedBox(height: 10,),



            Container(child:isGrid?futuregrid(dynamicGrid):futureslider(dynamicGrid),),



          ],
        ),
      ),

    );


  }



  }

