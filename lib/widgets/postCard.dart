import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/data.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/postDisplayModel.dart';
import 'package:project2/models/connection.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:project2/models/user_model.dart';

Widget postCard(PostDisplay1 x, BuildContext context) {


  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      // height: 450,
      // width: 360,
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Column(
          children: [
            // Avtar Image and username
            Container(
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Initicon(text: "${x.result[0].name}",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                      backgroundColor: Theme.of(context).primaryColor,),
                      radius: 15,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("${x.result[0].name}",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color))
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Container(
                width: double.maxFinite,
                height: 350,
                child: Image.network('${x.image}', fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Transform.scale(
                        scale: 0.10, child: CircularProgressIndicator(strokeWidth: 38,));
                  }
                })),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('${x.caption}',
                      style: GoogleFonts.montserrat(
                          color:
                              Theme.of(context).textTheme.titleLarge!.color)),
                ],
              ),
            ),

            Row(
              children: [
                LikeButton(
                  likeBuilder: (isliked) {
                    return Icon(
                      isliked ? Icons.favorite : Icons.favorite_outline,
                      size: 32,
                      color: isliked ? Colors.redAccent : Theme.of(context).canvasColor,

                    );
                  },
                  // onTap: (isliked) async
                  // {
                  //   var success = await MongoDatabase.updatepost(x.id);
                  //
                  //   /// if failed, you can do nothing
                  //   return !isliked;
                  // }

                  likeCount: x.likes,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/bubble-chat.png',
                    color: Theme.of(context).canvasColor,)),

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
                          fontWeight: FontWeight.w100, color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
