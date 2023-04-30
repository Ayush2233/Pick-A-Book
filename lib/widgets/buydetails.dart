import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buydetails extends StatelessWidget {
  final String name;
  final String email;
  final String title;
  final String image;

  const buydetails({
    required this.name,
    required this.email,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  Colors.grey.shade300,
        ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                Center(
                  child: Text(
                    'Sell Details',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color),
                  ),
                ),
            SizedBox(
              height: 30,
            ),
            // SizedBox(height: 20,),
            Center(child: Image.network(image, fit: BoxFit.cover)),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                  title,
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
            ),
                Padding(padding: EdgeInsets.all(5)),
            ],
            ),
          ),




          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            width: double.maxFinite,
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                      ),
                      SizedBox(width: 7),
                      Text(
                        textAlign: TextAlign.left,
                         name,
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.titleLarge?.color),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outlined,
                      ),
                      SizedBox(width: 7),
                      Text(
                        email,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.titleLarge?.color),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
