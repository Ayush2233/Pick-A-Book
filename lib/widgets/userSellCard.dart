import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/sell_model.dart';
import 'package:project2/models/connection.dart';

Widget userSellCard(Sellmodel data, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    // height: 300,
    child: FittedBox(
      fit: BoxFit.contain,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 130,
              width: 85,
              child: Image.network('${data.coverPage}', fit: BoxFit.cover)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
            width: 85,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2))),
              onPressed: () {
                showAlertDialog(context, data.title, data.bookId);
              },
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'REMOVE',
                    style: TextStyle(fontSize: 13),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
// Image.network('${data.coverPage}',fit: BoxFit.cover),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, String title, int book_id) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {
      MongoDatabase.removeUserSelling(book_id);
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
        textAlign: TextAlign.center,
        "Sure about Removing?",
        style: GoogleFonts.montserrat(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        )),
    content: Text("Do you want to remove '$title' from your sell listing?",
        style: GoogleFonts.montserrat(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        )),
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
