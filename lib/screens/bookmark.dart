import 'package:flutter/material.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/wishListDisplayModel.dart';
import 'package:project2/widgets/wishListCard.dart';

import '../models/user_model.dart';


class bookmark extends StatefulWidget {
  final Usermap userdetails;
  const bookmark({required this.userdetails, Key? key}) : super(key: key);

  @override
  State<bookmark> createState() => _bookmarkState();
}
var data;



class _bookmarkState extends State<bookmark>  with TickerProviderStateMixin{
  @override

  void initState() {


    // TODO: implement initState

    super.initState();
  }
  Widget build(BuildContext context) {

    TabController _listtabcontroller = TabController(length: 2, vsync: this);


    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                // padding: EdgeInsets.only(left: 20),
                child: Align(

                  alignment: Alignment.centerLeft,

                  child: TabBar(

                      controller: _listtabcontroller,
                      labelColor: Theme.of(context).textTheme.titleSmall?.color,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: UnderlineTabIndicator(borderSide: BorderSide(color:Theme.of(context).primaryColor,width: 3.5),),
                      unselectedLabelColor: Theme.of(context).textTheme.titleMedium?.color,
                      tabs:
                      [
                        Tab(text: "Want to Read",),
                        Tab(text: "Already Read",),
                      ] ),
                ),
              ),

              SizedBox(height: 15,),
              Container(

                width: double.maxFinite,
                height: double.maxFinite,
                // color: Colors.black,
                child: TabBarView(
                    controller: _listtabcontroller,
                    children:
                    [


                      Container(
                        // height: 700,
                        child: FutureBuilder(
                          future: MongoDatabase.fetchWishList(),
                          builder: (context , AsyncSnapshot snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return Align(alignment: Alignment.center,child:Column(crossAxisAlignment: CrossAxisAlignment.center,children: [SizedBox(height: 200,),CircularProgressIndicator()],));
                            }
                            else{
                              if(snapshot.hasData){
                                return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context , index)
                                    {
                                      return wishListCard(WishListDisplayModel.fromJson(snapshot.data[index]), context);
                                    }
                                );

                              }else{
                                return Text("No data");
                              }
                            }
                          },
                        ),
                      ),
                      FutureBuilder(
                        future: MongoDatabase.fetchWishList(),
                        builder: (context , AsyncSnapshot snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting){
                            return CircularProgressIndicator();
                          }
                          else{
                            if(snapshot.hasData){
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context , index)
                                  {
                                    return wishListCard(WishListDisplayModel.fromJson(snapshot.data[index]), context);
                                  }
                              );

                            }else{
                              return Text("No data");
                            }
                          }
                        },
                      ),

                    ]
                ),

              ),


            ],
          ),
        )


    );
  }
}
