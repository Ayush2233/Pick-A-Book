import 'package:flutter/material.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/screens/bookdetails.dart';

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
        margin: EdgeInsets.only(left: 20),
        height: 160,
        child: Image.network('${data.coverPage}',fit: BoxFit.cover),
      )
  );
}

