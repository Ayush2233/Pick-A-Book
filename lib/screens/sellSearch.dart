import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:project2/widgets/grid.dart';


class sellSearch extends StatefulWidget {
  const sellSearch({Key? key}) : super(key: key);

  @override
  State<sellSearch> createState() => _sellSearchState();
}


class _sellSearchState extends State<sellSearch> with TickerProviderStateMixin{

  var dynamicGrid;
  var searchdata;
  String searchquery='';

  Future<List<Map<String,dynamic>>> _performSearch(String query) async {
    if (query.isEmpty) {
      return [];
    } else {
      final searchResult = await MongoDatabase.fetsearch(query);
      return searchResult;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    dynamicGrid= MongoDatabase.fetchnewbooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).textTheme.titleSmall?.color,

      ),
        body:SingleChildScrollView(
        child: Column(

        children: [
          SizedBox(height: 20,),
          // Text("Select the Books you want to sell",
          //   textAlign: TextAlign.left,
          //   style: GoogleFonts.montserrat(
          //   fontSize: 15,
          //   fontWeight: FontWeight.normal,
          //   color: Colors.black),),

        SizedBox(height: 20,),

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
    dynamicGrid=_performSearch(searchquery);
    });
    },
    onSubmitted: (value)
    {

    setState(() {
    searchquery=value;
    dynamicGrid=_performSearch(searchquery);
    });
    },
    decoration: InputDecoration(
    filled: true,fillColor: Theme.of(context).textTheme.titleSmall?.color,
    suffixIcon: Icon(CupertinoIcons.search_circle_fill,color: Colors.white,size: 47,),


    hintText: 'Search for the Books you want to sell...',
    hintStyle: TextStyle(fontSize: 13,color: Colors.white),


    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
    borderSide: BorderSide.none
    )),
    ),
    ),
    ),),
          SizedBox(height: 25,),

          Container(padding: EdgeInsets.all(10),child:futureSellGrid(dynamicGrid),
          height: double.maxFinite,)
    ],)));
  }
}
