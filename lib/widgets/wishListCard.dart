import 'package:project2/models/wishListDisplayModel.dart';
import 'package:flutter/material.dart';
Widget wishListCard(WishListDisplayModel x , BuildContext context){

  return Column(
    children: [
      Container(
        child: Row(
          children: [
            Container(
              height: 180,
              width: 90,
              decoration: BoxDecoration(
                  boxShadow:[BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                  ]
              ),
              child: Image.network(x.result[0].coverPage),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${x.result[0].title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  SizedBox(height: 10,),

                  Text("${x.result[0].authorName}",style: TextStyle(fontSize: 15),),

                  SizedBox(height: 10,),

                  Text('${x.result[0].ratingsCount} ',style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            SizedBox(width: 130,),
            Container(child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),)
          ],
        ),
      ),
      SizedBox(height: 10,)
    ],
  );

}