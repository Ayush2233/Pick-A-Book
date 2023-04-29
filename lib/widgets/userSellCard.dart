import 'package:flutter/material.dart';
import 'package:project2/models/sell_model.dart';
import 'package:project2/models/connection.dart';

Widget userSellCard(Sellmodel data, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.pinkAccent),
        borderRadius: BorderRadius.circular(10)
    ),
    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    // height: 300,
    child: Column(
      children: [
        SizedBox(
          height: 15 ,
        ),
        SizedBox(height:130,width: 85, child: Image.network('${data.coverPage}', fit: BoxFit.cover)),
        SizedBox(
          height: 20 ,
        ),
        SizedBox(
          height: 30,
          width: 85,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
            ),
            onPressed: () {
              showAlertDialog(context, data.title, data.bookId);
            },
            child: Text('REMOVE', style: TextStyle(fontSize: 13),),
          ),
        ),
      ],
// Image.network('${data.coverPage}',fit: BoxFit.cover),
    ),);
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

