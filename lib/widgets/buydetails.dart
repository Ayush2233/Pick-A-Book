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
            'Title: ' + title,
            style: GoogleFonts.montserrat(fontSize:16,fontWeight: FontWeight.bold,color: Theme.of(context).textTheme.titleLarge?.color),
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
                  color: Colors.pink.shade100,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Text(
              ' Name:' + name + '\n\n' + ' Email: ' + email,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color),
            ),
            // Text(
            //   'Email: ' + email,
            //   textAlign: TextAlign.left,
            //   style: TextStyle(color: Colors.black),
            // ),
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
