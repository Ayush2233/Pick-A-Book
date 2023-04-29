import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/homeslider.dart';
import 'package:project2/models/connection.dart';
import 'genreresult.dart';




class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin{

   var dynamicFuture;
  var dynamicGrid;
  
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
        child:
        Column(
          children: [

            SizedBox(height: 15,),

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
                      isSearch=true;
                      // dynamicText=genrelist[8];
                      // dynamicGrid=_performSearch(searchquery);
                    });
                  },
                  onSubmitted: (value)
                  {

                    setState(() {
                      isSearch=true;
                      searchquery=value;
                      // dynamicText=genrelist[8];
                      // dynamicGrid=_performSearch(searchquery);
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

            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: isSearch?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search Results",style: GoogleFonts.montserrat(fontSize:25,fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.titleLarge?.color)),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          isGrid=!isGrid;
                        });
                      },
                      icon:Icon(isGrid?Icons.list:Icons.grid_view,color:Theme.of(context).textTheme.titleLarge!.color,)
                  )
                ],
              )

                  :Text("Explore Genres",

                  style: GoogleFonts.montserrat(fontSize:25,fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.titleLarge?.color)),
            ),



            SizedBox(height: 30,),

            isSearch?(isGrid?futuregrid(_performSearch(searchquery)):futurelistview(_performSearch(searchquery))):Column(children: [
                // Fantasy ROmance
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchfantasybooks(),genrestring: "Fantasy and Paranormal",)));
                      },
                      child: Container(
                        width: 165,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/fant.png',)),

                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchRomancebooks(),genrestring: "Romance",)));
                      },
                      child: Container(
                        width: 195,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/roman.png',)),

                      ),
                    ),
                  ],
                ),

                // Children comics
                SizedBox(height: 8,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchChildrenbooks(),genrestring: "Children",)));
                      },
                      child: Container(
                        width: 195,
                        // color: Colors.red,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/child.png',)),

                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchComicbooks(),genrestring: "Comics",)));
                      },
                      child: Container(
                        width: 165,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/comicc.png',)),

                      ),
                    ),
                  ],
                ),

                //Mystery History
                SizedBox(height: 8,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(


                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchMysterybooks(),genrestring: "Mystery & Thriller",)));
                      },
                      child: Container(

                        width: 185,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/myst.png',)),

                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchHistorybooks(),genrestring: "History and Biography",)));
                      },
                      child: Container(
                        width: 175,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/hist.png',)),

                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchPoetrybooks(),genrestring: "Poetry",)));
                      },
                      child: Container(
                        width: 170
                        ,
                        // color: Colors.red,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/portt.png',)),

                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            genreresult(genrefuture: MongoDatabase.fetchYoungadultbooks(),genrestring: "Young Adult",)));
                      },
                      child: Container(

                        width: 190,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        // color: Colors.red,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/yaa.png',)),

                      ),
                    ),
                  ],
                ),


              ],),





            // SizedBox(height: 20,),
            //
            //
            // Container(
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //   // color: Colors.red,
            //   child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Image.asset('assets/images/read.png',)),
            //
            // ),



            // Poetry and young adult





            // Container(child:isGrid?futuregrid(dynamicGrid):futureslider(dynamicGrid),),

            // futureslider(_performSearch(searchquery)),



          ],
        ),
      ),

    );


  }



  }

