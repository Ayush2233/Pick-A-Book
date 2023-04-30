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
      title: Text(
        'User Details',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 20,),
          Center(child: Image.network(image, fit: BoxFit.cover)),
          SizedBox(
            height: 30,
          ),
          Text(
            textAlign: TextAlign.center,

              title,
            style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            width: double.maxFinite,
            height: 90,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // color: Colors.pink.shade100,
                  //offset: const Offset(
                  //  5.0,
                  //  5.0,
                  // ),
                  // blurRadius: 10.0,
                  // spreadRadius: 5.0,
                  //  ), //BoxShadow
                  // BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  //blurRadius: 0.0,
                  // spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                Row(
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
