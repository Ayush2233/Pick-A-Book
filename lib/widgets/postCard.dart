import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/data.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/postDisplayModel.dart';
import 'package:project2/models/connection.dart';




Widget postCard(PostDisplay1 x){

  return Padding(
    padding: const EdgeInsets.only(bottom: 20),

    child: Container(
      height: 400,
      width: 360,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
          // color: Colors.pink.withOpacity(0.1),
          color: Colors.black.withOpacity(0.1),

          spreadRadius: 1,
          blurRadius: 2,
        )
      ]),

      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [

            Container(
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userimage),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${x.result[0].name}",
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Text('${x.caption}'),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(300)),
                    ),
                    // margin: EdgeInsets.only(top: 20),
                    // height: 200,
                    width: 360,
                    height: 200,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network('${x.image}',fit: BoxFit.cover,)
                    ))
              ],
            ),
            Row(
              children: [
                LikeButton(

                  likeBuilder: (isliked)
                  {
                    return Icon(isliked?Icons.favorite:Icons.favorite_outline,size: 32,color: isliked?Colors.redAccent:Colors.black,);
                  },
                  onTap: (isliked) async
                  {
                    var success = await MongoDatabase.updatepost(x.id);

                    /// if failed, you can do nothing
                    return !isliked;
                  }
                  ,
                  likeCount: x.likes,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/bubble-chat.png')),

              ],
            ),

            Column(
              children: [
                Divider(
                  height: 5,
                  thickness: 1,
                  color: Colors.grey,
                )
              ],
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(userimage),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Add a comment',
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}