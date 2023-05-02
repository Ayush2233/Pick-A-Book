import 'package:flutter/material.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/screens/bookdetails.dart';
import '../models/connection.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: FittedBox(
          fit:BoxFit.contain,
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
                showAlertDialog(Fireuser.uid.toString(), data.bookId, data.title, data.description, data.coverPage, data.author, context);
              },
              child: Text('SELL'),
            ),
              // child:TextButton(onPressed: () {
              //   sellitem(Fireuser.uid.toString(), data.bookId, data.title, data.description, data.coverPage, data.author);
              // }
              //     , child: Text('SELL'))
          ),
              SizedBox(height: 10,),
            ],
            // Image.network('${data.coverPage}',fit: BoxFit.cover),
          ),
        )),
  );
}
showAlertDialog(String uid , int book_Id, String title, String description, String coverPage, String author,BuildContext context)
{

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
      sellitem(uid, book_Id, title, description, coverPage, author);
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: Text(textAlign: TextAlign.center,"Sure about selling ?", style: GoogleFonts.montserrat(
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: 18,
        fontWeight: FontWeight.w600,)),
    content: Text("Are you sure you want to sell the book '$title' ?", style: GoogleFonts.montserrat(
      color: Theme.of(context).textTheme.titleLarge?.color,
      fontSize: 14,
      fontWeight: FontWeight.w300,)),
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
