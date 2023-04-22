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


class _bookmarkState extends State<bookmark> {
  @override

  var wishlist;

  void initState() {
    data=MongoDatabase.fetchHistorybooks();
    wishlist = MongoDatabase.fetchWishList();
    // TODO: implement initState

    super.initState();
  }
  Widget build(BuildContext context) {


    return Scaffold(

        body: FutureBuilder(
          future: wishlist,
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
        )


    );
  }
}
