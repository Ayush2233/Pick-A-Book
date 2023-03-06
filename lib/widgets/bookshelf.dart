import 'package:flutter/material.dart';
import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';


Widget bookshelf()
{
  return Container(
    width: 380,
    child: Stack(
      children:
      [
        Container(
          margin: EdgeInsets.only(left: 60),
          height: 150,
          width: 300,
          child: Row(
            children: [Container(

              child: CarouselSlider.builder(
                  options: CarouselOptions(viewportFraction: .35),
                  itemCount: 5,
                  itemBuilder: (context,index,readIndex)
                {
                  return Container(
                    margin:EdgeInsets.only(),
                    // color: Colors.grey,
                    child: Image.network(covers[index],fit: BoxFit.cover,),
                    );
                },
              ),
              height: 100,
              width: 260,
            ),]

          )
        ),
        Positioned(
          child: Container(
            width: 380,
              child: Image.asset('assets/images/shelff.png',scale: .1,fit: BoxFit.cover,),),
          top: 114,
          left:0,

        ),



      ],
    ),
  );
}