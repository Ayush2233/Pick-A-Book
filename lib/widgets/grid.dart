import 'package:project2/models/data.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/sell_model.dart';
import 'package:project2/widgets/sellcard.dart';
import 'package:project2/models/buyModel.dart';

import 'buyCard.dart';

Widget futuregrid(Future future)
{
  return Container(
    height: 150,
    width: double.maxFinite,
    child: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),);
          }
          else
          {
            if(snapshot.hasData)
            {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 5 / 9,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,

                  ),
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index)
                  {
                    return sellcard(Bookmap.fromJson(snapshot.data[index]),context);
                  }
              );
            }
            else
            {
              return Center(child: Text('No Data Available'),);
            }
          }
        }),
  );
}

Widget futurebuygrid(Future future)
{
  return Container(
    height: 150,
    width: double.maxFinite,
    child: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),);
          }
          else
          {
            if(snapshot.hasData)
            {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 5 / 9,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,

                  ),
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, index)
                  {
                    return buycard(BuyModel.fromJson(snapshot.data[index]),context);
                  }
              );
            }
            else
            {
              return Center(child: Text('No Data Available'),);
            }
          }
        }),
  );
}