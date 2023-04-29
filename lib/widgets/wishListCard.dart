

import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/wishListDisplayModel.dart';
import 'package:flutter/material.dart';
import 'package:project2/screens/bookdetails.dart';


Widget wishListCard(WishListDisplayModel x,BuildContext context)
{
  return GestureDetector
    (
     child: Container(
        // color: ,

        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(

          children: [
            Container(width: 100,child: Image.network(x.result[0].coverPage,fit:BoxFit.cover),),
            SizedBox(width: 10,),

            Container(
              // color: Colors.red,
              width: 250,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${x.result[0].title}',
                    // textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.titleLarge!.color),
                    maxLines: 3,
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${x.result[0].authorName}',
                          style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge!.color)

                      ),
                      // SizedBox(width: 50,),

                      Row(
                        children: [
                          Text('${x.result[0].bookAverageRating}',style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge!.color)),
                          Icon(Icons.star,color: Colors.orange,),

                        ],
                      ),

                      IconButton(onPressed: (){
                        MongoDatabase.removeWishlistElement(x.result[0].bookId);
                      }, icon: Icon(Icons.delete,color: Theme.of(context).textTheme.titleLarge!.color,))

                    ],
                  )
                ],
              ),
            )
          ],


        ),
      )
  );
}