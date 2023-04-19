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

   var dynamicFuture;
  var dynamicGrid;

  var searchdata;
  String searchquery='';

  @override

  Future<List<Map<String,dynamic>>> _performSearch(String query) async {
    if (query.isEmpty) {
      return [];
    } else {
      final searchResult = await MongoDatabase.fetsearch(query);
      return searchResult;
    }
  }


  void initState() {
    // TODO: implement initState

    dynamicFuture=[MongoDatabase.fetchChildrenbooks(),MongoDatabase.fetchMysterybooks(),MongoDatabase.fetchYoungadultbooks(),MongoDatabase.fetchfantasybooks(),MongoDatabase.fetchComicwithMarvelbooks(),MongoDatabase.fetchHistorybooks(),MongoDatabase.fetchRomancebooks(),MongoDatabase.fetchPoetrybooks()];
    dynamicGrid=MongoDatabase.fetchtopratedbooks();

    print("search init done");
    super.initState();
  }


  List genrelist =["Children","Mystery","Young Adult","Fantasy","Comic","History","Romance","Poetry","Search Results"];
  var dynamicText="Top Rated";



  bool isGrid = true;
  bool isSearch = false;
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

                  style: TextStyle(color: Colors.white),
                  onChanged:(value) async
                  {
                    // final z=await _performSearch(searchquery);
                    setState(() {
                      searchquery=value;
                      dynamicText=genrelist[8];
                      dynamicGrid=_performSearch(searchquery);
                    });
                  },
                  onSubmitted: (value)
                  {

                    setState(() {
                      searchquery=value;
                      dynamicText=genrelist[8];
                      dynamicGrid=_performSearch(searchquery);
                    });
                  },
                  decoration: InputDecoration(
                      filled: true,fillColor: Theme.of(context).textTheme.titleSmall?.color,
                      suffixIcon: Icon(CupertinoIcons.search_circle_fill,color: Colors.white,size: 47,),


                      hintText: 'Search Book...',
                      hintStyle: TextStyle(fontSize: 13,color: Colors.white),


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
                Row(children: [
                  SizedBox(width: 20,),

                  Text('Genre',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color),),],),

                SizedBox(height: 20,),
                //ROW 1 - 3 GENRE
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                  InkWell(
                    onTap: (){setState(()
                    {
                      dynamicText=genrelist[0];
                      dynamicGrid=dynamicFuture[0];
                    });},
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Image.asset('assets/images/children.png',),
                          Text("Children",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color))
                        ],
                      )
                    ),
                  ),

                  InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[1];
                        dynamicGrid=dynamicFuture[1];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/mystery.png',height: 70,),
                              Text("Thriller",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color))
                            ],
                          )
                      ),
                    ),
                  InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[2];
                        dynamicGrid=dynamicFuture[2];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/younga.png',height: 70,),
                              Text("Young Adult",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color))
                            ],
                          )
                      ),
                    ),

                  InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[3];
                        dynamicGrid=dynamicFuture[3];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/fantasy.png',height: 70,),
                              Text("Fantasy",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color))
                            ],
                          )
                      ),
                    ),


                ],),

                SizedBox(height: 10,),

                //ROW 2 - GENREE
                // Row(
                // children: [
                //   SizedBox(width: 70,),
                //
                //   //FANTASY
                //
                //
                //
                //   SizedBox(width: 40,),
                //
                //   //COMIC
                //
                // ],),

                SizedBox(height: 10,),

                //ROW 3
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[4];
                        dynamicGrid=dynamicFuture[4];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/comic.png',height: 70,),
                              Text("Comics",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color))
                            ],
                          )
                      ),
                    ),

                    //HISTORY
                    InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[5];
                        dynamicGrid=dynamicFuture[5];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/history.png',height: 70,),
                              Text("History",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color))
                            ],
                          )
                      ),
                    ),

                    //ROMANCE
                    InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[6];
                        dynamicGrid=dynamicFuture[6];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/rom.png',height: 70,),
                              Text("Romance",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color)),
                            ],
                          )
                      ),
                    ),

                    //POETRY
                    InkWell(
                      onTap: (){setState(()
                      {
                        dynamicText=genrelist[7];
                        dynamicGrid=dynamicFuture[7];
                      });},
                      child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Image.asset('assets/images/poetry.png',height: 70,),
                              // SizedBox(height: 4,),
                              Text("Poetry",style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge?.color),)
                            ],
                          )
                      ),
                    ),

                  ],),

              ],
            ),
            ),

            SizedBox(height: 30,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("$dynamicText",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).textTheme.titleLarge?.color),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,20,0),
                child: IconButton(onPressed: ()
                {
                  setState(() {
                    isGrid=!isGrid;
                  });
                },
                    icon: Icon(isGrid?Icons.list:Icons.grid_view,color: Theme.of(context).textTheme.titleLarge?.color)),
              )
            ],),

            SizedBox(height: 10,),



            Container(child:isGrid?futuregrid(dynamicGrid):futureslider(dynamicGrid),),
            
            // futureslider(_performSearch(searchquery)),



          ],
        ),
      ),

    );


  }



  }

