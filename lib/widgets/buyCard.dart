import 'package:flutter/material.dart';
import 'package:project2/widgets/buydetails.dart';
import 'package:project2/models/marketPlaceModel.dart';

Widget buycard(MarketPlaceModel data, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    // height: 300,
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
              showDialog(
                context: context,
                builder: (_) => buydetails(
                  name: '${data.user[0].name}',
                  email: '${data.user[0].email}',
                  title: '${data.title}',
                  image: '${data.coverPage}',
                ),
              );
            },
            child: Text('BUY'),
          ),
        ),
      ],
    ),
  );
}
