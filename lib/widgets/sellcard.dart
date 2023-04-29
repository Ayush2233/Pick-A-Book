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
        decoration:
        BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        height: 160,
        child: Column(
          children: [
            SizedBox(
              height: 20 ,
            ),
            SizedBox(height:130,width: 85, child: Image.network('${data.coverPage}', fit: BoxFit.cover)),
            SizedBox(height: 20,),
        SizedBox(
            height: 30,
            width: 85,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
            ),
            onPressed: () {
              sellitem(Fireuser.uid.toString(), data.bookId, data.title, data.description, data.coverPage, data.author);
            },
            child: Text('SELL'),
          ),
            // child:TextButton(onPressed: () {
            //   sellitem(Fireuser.uid.toString(), data.bookId, data.title, data.description, data.coverPage, data.author);
            // }
            //     , child: Text('SELL'))
        ),
          ],
          // Image.network('${data.coverPage}',fit: BoxFit.cover),
        )),
  );
}
