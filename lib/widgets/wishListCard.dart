import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/wishListDisplayModel.dart';
import 'package:flutter/material.dart';


Widget wishListCard(WishListDisplayModel x,BuildContext context)
{
  return GestureDetector
    (
     child: Container(
        // color: ,

        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(

          children: [
            Container(width: 100,child: Image.network(x.result[0].coverPage,fit:BoxFit.cover),),
            SizedBox(width: 10,),

            Container(
              // color: Colors.red,
              width: 250,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${x.result[0].title}',
                    // textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.titleLarge!.color),
                    maxLines: 3,
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${x.result[0].authorName}',
                          style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge!.color)

                      ),
                      // SizedBox(width: 50,),

                      Row(
                        children: [
                          Text('${x.result[0].bookAverageRating}',style: GoogleFonts.montserrat(color: Theme.of(context).textTheme.titleLarge!.color)),
                          Icon(Icons.star,color: Colors.orange,),

                        ],
                      ),

                      IconButton(onPressed: (){
                        // MongoDatabase.removeWishlistElement(x.result[0].bookId);
                        showAlertDialog(context, x.result[0].title, x.result[0].bookId);
                      }, icon: Icon(Icons.delete,color: Theme.of(context).textTheme.titleLarge!.color,))

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
      MongoDatabase.removeWishlistElement(book_id);
      Navigator.of(context).pop();

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Sure?"),
    content: Text("Do you want to remove $title from wishlist"),
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