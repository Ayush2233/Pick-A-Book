import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
      autoPlayInterval: Duration(seconds: 2) ,
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

