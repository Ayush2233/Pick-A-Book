import 'package:flutter/material.dart';


class bookmark extends StatefulWidget {
  const bookmark({Key? key}) : super(key: key);

  @override
  State<bookmark> createState() => _bookmarkState();
}

class _bookmarkState extends State<bookmark> {
  @override
  Widget build(BuildContext context) {

    var arrNames = [
      'The Mind Of A Leader',
      'The Great Gatsby ',
      'Five Feet Apart',
      'The Great Unknowable End',
      'Wish Upon A Star',
      'Harry Potter',
      'Lunar Storm',
      'Sorrow and Bliss',
      'To Kill A Mocking Bird'
    ];

    var arrSubtitles = [
      'Kevin Anderson',
      'F Scott Fitzgerald',
      'Rachael Lippincott',
      'Kathryn Ormsbee',
      'Linda Lennon',
      'J.K Rowling',
      'Terry Crosby',
      'Meg Mason',
      'Harper Lee',
    ];
    return Scaffold(

        body: ListView.separated(itemBuilder: (context,index){
          return Container(
            child: Row(

              children: [
                Container(

                  height: 180,
                  decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 2,
                        )
                      ]
                  ),
                  child: Image.network('https://d1csarkz8obe9u.cloudfront.net/posterpreviews/yellow-business-leadership-book-cover-design-template-dce2f5568638ad4643ccb9e725e5d6ff.jpg?ts=1637017516'),

                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(arrNames[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(arrSubtitles[index],style: TextStyle(fontSize: 15),),
                      SizedBox(height: 10,),
                      Text('⭐   4.5 ',style: TextStyle(fontSize: 15),),

                    ],

                  ),
                )
              ],
            ),
          );
        },
          itemCount: arrNames.length,
          separatorBuilder: (context,index){
            return Divider(height:30, thickness: 0.5,color: Colors.black,);

          },
        )

    );
  }
}
