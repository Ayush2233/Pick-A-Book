import 'package:flutter/material.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/screens/bookdetails.dart';
import '../models/connection.dart';

Widget sellcard(Bookmap data, BuildContext context) {
  return GestureDetector
    (
    onTap: () {
      var Book = bookdetails(data: data);
      Book.bottomup(context);
    },
    child: Container(

        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 160,
        child: Column(
          children: [
            Image.network('${data.coverPage}', fit: BoxFit.cover),
            SizedBox(height: 5,),
            TextButton(onPressed: () {
              sellitem(Fireuser.uid.toString(), data.bookId, data.title, data.description, data.coverPage, data.author);
            }
                , child: Text('SELL'))
          ],
          // Image.network('${data.coverPage}',fit: BoxFit.cover),
        )),
  );
}
