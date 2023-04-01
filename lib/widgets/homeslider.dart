import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'bookcard.dart';
import 'package:project2/models/book_model.dart';

Widget homeslider(String url ,int index)
{
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    // color: Colors.grey,
    child: Image.network(url),
  );
}

Widget homeslidernew()
{
  return CarouselSlider.builder(

    itemCount: covers.length,
    options: CarouselOptions(
      // viewportFraction: .35,
      viewportFraction: .28,
      height: 150,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3) ,
      enlargeCenterPage: true,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      pageSnapping: false,
    ),
    itemBuilder: (context,index, realIndex)
    {
      final image = covers[index];
      return homeslider(image,index);
    },);
}

Widget futureslider(Future future)
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
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index)
                  {
                    return bookscard(Bookmap.fromJson(snapshot.data[index]),context);
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
