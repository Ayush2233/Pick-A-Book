import 'package:flutter/material.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/screens/bookdetails.dart';
import '../models/connection.dart';
import 'package:project2/models/buyModel.dart';

Widget buycard( BuyModel data, BuildContext context) {
  return GestureDetector
    (
    onTap: () {
      var Book = bookdetails(data: data.books[0]);
      Book.bottomup(context);
    },
    child: Container(

        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 160,
        child: Column(
          children: [
            Image.network( '${data.books[0].coverPage}', fit: BoxFit.cover),
            SizedBox(height: 5,),
            TextButton(onPressed: () {
            }
                , child: Text('BUY'))

          ],
          // Image.network('${data.coverPage}',fit: BoxFit.cover),
        )),
  );
}
