import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/screens/bookdetails.dart';

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

Widget bookstile(Bookmap x,BuildContext context)
{
  return GestureDetector
    (
      onTap: ()
      {
        var Book= bookdetails(data: x);
        Book.bottomup(context);
      },

      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(

                  height:150,

                  child: Image.network(x.coverPage,fit: BoxFit.cover,),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text("${x.title}",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 4,
                      // overflow: TextOverflow.ellipsis,


                    ),

                    SizedBox(height: 10,),

                    Text("${x.author}",style: TextStyle(fontSize: 15),),

                    SizedBox(height: 10,),

                    Text('${x.bookAverageRating} ',style: TextStyle(fontSize: 15),),
                  ],
                ),


                SizedBox(width: 130,),
                Container(child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),)
              ],),
          ),
          // SizedBox(height: 10,)
        ],
      ),
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
                      Text('${x.author}'),
                      // SizedBox(width: 50,),

                      Row(
                        children: [
                          Text('${x.bookAverageRating}'),
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

