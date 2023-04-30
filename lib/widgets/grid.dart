import 'package:flutter/material.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/models/sell_model.dart';
import 'package:project2/widgets/sellcard.dart';
import 'package:project2/models/marketPlaceModel.dart';
import 'package:project2/widgets/userSellCard.dart';

import 'buyCard.dart';

Widget futureSellGrid(Future future) {
  return Container(
    // height: 150,
    // width: double.maxFinite,
    child: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return Center(
            //   child: CircularProgressIndicator(),);
            return Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 230,
                    ),
                    CircularProgressIndicator()
                  ],
                ));
          } else {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 6 / 10,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 12,
                  ),
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return sellcard(
                        Bookmap.fromJson(snapshot.data[index]), context);
                  });
            } else {
              return Center(
                child: Text('No Data Available'),
              );
            }
          }
        }),
  );
}
Widget futurebuygrid(Future future) {
  return Container(
    // height: 800,
    // width: double.maxFinite,
    child: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return Center(child: CircularProgressIndicator(),);
            return Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 230,
                    ),
                    CircularProgressIndicator(),
                  ],
                ));
          } else {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 6/ 10,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 12,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return buycard(
                        MarketPlaceModel.fromJson(snapshot.data[index]),
                        context);
                  });
            } else {
              return Center(
                child: Text('No Data Available'),
              );
            }
          }
        }),
  );
}

Widget userSellGrid(Future future) {
  return Container(
    // height: 150,
    // width: double.maxFinite,
    child: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 230,
                    ),
                    CircularProgressIndicator()
                  ],
                ));
          } else {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 6 / 10,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 12,
                  ),
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return userSellCard(
                        Sellmodel.fromJson(snapshot.data[index]), context);
                  });
            } else {
              return Center(
                child: Text('No Data Available'),
              );
            }
          }
        }),
  );
}
