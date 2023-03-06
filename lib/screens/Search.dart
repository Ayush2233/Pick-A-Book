import 'package:flutter/material.dart';
import 'package:project2/widgets/appbar.dart';
import 'package:project2/widgets/drawer.dart';
import 'package:project2/widgets/Bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:project2/models/data.dart';


class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custAppbar(),
      bottomNavigationBar:custBottombar(),
      endDrawer: custDrawer(),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 55,child: SizedBox(width: 370,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,7,0,0),
                child: TextField(
                  decoration: InputDecoration(filled: true,fillColor: Color(0xFFf3f3f3),suffixIcon: Icon(CupertinoIcons.search_circle_fill,color: Color(0xFFDE6077),size: 50,),hintText: 'Search Book...',
                      hintStyle: TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide.none
                      )),
                ),
              ),
            ),),

            SizedBox(height: 40,),

            Container(height: 300,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,           // Row 1
                  children: [
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Fiction',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                    ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Non-Fiction',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Romantic',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                ],),

                SizedBox(height: 10,),

                Row(                                                           //Row 2
                children: [
                  SizedBox(width: 70,),
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Horror',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                    ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  SizedBox(width: 40,),
                  SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Comedy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                    ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                ],),

                SizedBox(height: 10,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Fantasy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Mystery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Thriller',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  ],),

                SizedBox(height: 10,),

                Row(                                                           //Row 2
                  children: [
                    SizedBox(width: 70,),
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Biography',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                    SizedBox(width: 40,),
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Art',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  ],),

                SizedBox(height: 10,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Health',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('History',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                    SizedBox(width: 115,height: 43,child: OutlinedButton(onPressed: () {print("pressed");}, child: Text('Politics',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                      ,style:OutlinedButton.styleFrom(side: BorderSide(color: Color(0xFFDE6077)),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))) ,)),
                  ],),

              ],
            ),
            ),


            Container(height: 700,
              child: Column(children: [
                Row(children: [SizedBox(width: 30,),Text('Top Rated',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  SizedBox(width: 200,),Text('See All'),SizedBox(width: 10,),Icon(Icons.navigate_next)],),

                SizedBox(height: 20,),

                Container(height: 150,width: double.maxFinite,
                child: ListView.builder(scrollDirection: Axis.horizontal
                ,itemCount: covers.length,itemBuilder: (context,index){
                    return Container(margin: EdgeInsets.only(left: 20),height: 180, child: Image.network(covers[index],fit: BoxFit.cover));
                }),
              ),
                SizedBox(height: 20,),

                Row(children: [SizedBox(width: 30,),Text('Top Rated',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  SizedBox(width: 200,),Text('See All'),SizedBox(width: 10,),Icon(Icons.navigate_next)],),

                SizedBox(height: 20,),


                Container(height: 150,width: double.maxFinite,
                  child: ListView.builder(scrollDirection: Axis.horizontal
                      ,itemCount: covers.length,itemBuilder: (context,index){
                        return Container(margin: EdgeInsets.only(left: 20),height: 180,child: Image.network(covers[index],fit: BoxFit.cover));
                      }),
                ),

              ],)
            )
          ],
        ),
      ),

    );
  }
}
