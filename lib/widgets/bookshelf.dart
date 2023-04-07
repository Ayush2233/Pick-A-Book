import 'package:flutter/material.dart';
import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

CarouselController buttonCarouselController = CarouselController();
Widget bookshelf()
{
  return Center(
    child: Container(
      // color: Colors.red,
      width: 360,
      child: Stack(
        children:
        [
          Center(
            child: Container(
              // color: Colors.yellow,
              // margin: EdgeInsets.only(left: 60),
              height: 150,
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Color(0xff969696).withOpacity(.6),),
                      onPressed:(){
                        buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear);
                      }
                      ),
                  ),
                  Container(

                  child: CarouselSlider.builder(
                      options: CarouselOptions(viewportFraction: .30,autoPlay: true),
                      itemCount: 5,
                      itemBuilder: (context,index,readIndex)
                    {
                      return Container(
                        margin:EdgeInsets.only(),
                        // color: Colors.grey,
                        child: Image.network(cover1[index],fit: BoxFit.cover,),
                        );
                    },
                  ),
                  height: 100,
                  width: 260,
                ),
                  SizedBox(child: IconButton(icon: Icon(Icons.arrow_forward_ios,color: Color(0xff969696).withOpacity(.6)),onPressed:(){}),
                  ),
                ]

              )
            ),
          ),
          Positioned(
            child: Container(
              // color: Colors.grey,
              width: 380,
                child: Image.asset('assets/images/shelff.png',scale: .1,fit: BoxFit.cover,),),
            top: 114,
            left:0,

          ),
        ],
      ),
    ),
  );
}