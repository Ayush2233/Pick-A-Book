import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'bookcard.dart';
import 'package:project2/models/book_model.dart';


Widget futureslider(Future? future)
{
  return Container(
    height: 150,
    width: double.maxFinite,
    child: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting || future==null)
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


Widget carouselslider(Future future)
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
              return CarouselSlider.builder(

                itemCount: snapshot.data.length,
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
                  return bookscard(Bookmap.fromJson(snapshot.data[index]),context);
                },);
            }
            else
            {
              return Center(child: Text('No Data Available'),);
            }
          }
        }),
  );
}

Widget futuregrid(future)
{
  return Container(
    height: 600,
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
              return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                // crossAxisSpacing: 10,
                childAspectRatio: 9/12,
                mainAxisSpacing: 15,
                ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      return bookscardgrid(Bookmap.fromJson(snapshot.data[index]),context);

                    }) ;
            }
            else
            {
              return Center(child: Text('No Data Available'),);
            }
          }
        }),
  );
}



