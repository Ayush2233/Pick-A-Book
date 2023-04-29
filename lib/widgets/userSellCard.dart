import 'package:flutter/material.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/models/marketPlaceModel.dart';
import 'package:project2/models/sell_model.dart';
import 'package:project2/screens/bookdetails.dart';
import '../models/connection.dart';

Widget userSellCard(Sellmodel data, BuildContext context) {
  return GestureDetector
    (
    onTap: () {
      // var Book = bookdetails(data: data);
      // Book.bottomup(context);
    },
    child: Container(

        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 160,
        child: Column(
          children: [
            Image.network('${data.coverPage}', fit: BoxFit.cover),
            SizedBox(height: 5,),
            TextButton(onPressed: () {
              showAlertDialog(context, data.title, data.bookId);


            }
                , child: Text('Remove'))
          ],
        )),
  );
}


showAlertDialog(BuildContext context, String title , int book_id) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed:  () {
      MongoDatabase.removeUserSelling(book_id);
      Navigator.of(context).pop();

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Sure?"),
    content: Text("Do you want to remove $title from your selling"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}