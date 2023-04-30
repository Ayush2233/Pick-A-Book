import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/screens/bookdetails.dart';
import 'package:project2/models/RrecBookModel.dart';

import '../models/user_model.dart';

Widget bookscard(Bookmap data,BuildContext context)
{
  return GestureDetector
    (
        onTap: ()
        {
          var Book= bookdetails(data: data);
          Book.bottomup(context);
        },
        child: Container(
        margin: EdgeInsets.fromLTRB(10,0,10,0),
        height: 160,
        child: Image.network('${data.coverPage}',fit: BoxFit.cover),
      )
  );

}

Widget bookscardgrid(Bookmap data,BuildContext context)
{
  return GestureDetector
    (
        onTap: ()
        {
          var Book= bookdetails(data: data);
          Book.bottomup(context);
        },
        child: Container(
        margin: EdgeInsets.fromLTRB(8,0,8,0),
        height: 200,
        child: Image.network('${data.coverPage}',fit: BoxFit.cover),
      )
  );
}


Widget booktile(Bookmap x,BuildContext context)
{
  return GestureDetector
    (
      onTap: ()
      {
        var Book= bookdetails(data: x);
        Book.bottomup(context);
      },

      child: Container(
        // color: ,

        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(

          children: [
            Container(width: 100,child: Image.network(x.coverPage,fit:BoxFit.cover),),
            SizedBox(width: 10,),
            
            Container(
              // color: Colors.red,
              width: 250,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${x.title}',
                    // textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.titleLarge!.color),
                    maxLines: 3,
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${x.author}',
                        style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge!.color)

                      ),
                      // SizedBox(width: 50,),

                      Row(
                        children: [
                          Text('${x.bookAverageRating}',style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge!.color)),
                          Icon(Icons.star,color: Colors.orange,),
                          SizedBox(width: 10,)
                        ],
                      )
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

Widget bookscard12(Bookmap1 data,BuildContext context)
{
  return GestureDetector
    (
      onTap: ()
      {
        var book=bookdetails_recom(data: data);
        book.bottomup(context);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10,0,10,0),
        height: 100,
        child: Image.network('${data.coverPage}',fit: BoxFit.cover),
      )
  );

}