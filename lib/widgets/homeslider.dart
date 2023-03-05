import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
Widget homeslider(String url ,int index)
{
  return Container(
    margin: EdgeInsets.symmetric(),
    color: Colors.grey,
    child: Image.network(url,fit: BoxFit.cover,),

  );
}

Widget homeslidernew()
{
  return CarouselSlider.builder(
    itemCount: covers.length,
    options: CarouselOptions(
      viewportFraction: .35,
      height: 180,
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

