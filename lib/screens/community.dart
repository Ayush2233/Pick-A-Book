import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/data.dart';
class community extends StatefulWidget {
  const community({Key? key}) : super(key: key);

  @override
  State<community> createState() => _communityState();
}

class _communityState extends State<community> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){},backgroundColor: Color(0xffDE6077),),
      body:ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  // color: Colors.pink.withOpacity(0.1),
                  color: Colors.black.withOpacity(0.1),

                  spreadRadius: 1,
                  blurRadius: 2,
                )
              ]),

              height: 400,
              width: 360,
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(userimage),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Vivaan Sahai',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Text('Recently I have read Lord of the Rings '),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(300)),
                            ),
                            // margin: EdgeInsets.only(top: 20),
                            // height: 200,
                            width: 360,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(postimage[index],fit: BoxFit.cover,)
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        LikeButton(
                          likeBuilder: (isliked)
                          {
                            return Icon(isliked?Icons.favorite:Icons.favorite_outline,size: 32,color: isliked?Colors.redAccent:Colors.black,);
                          },
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/bubble-chat.png')),

                      ],
                    ),

                    Column(
                      children: [
                        Divider(
                          height: 5,
                          thickness: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(userimage),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Add a comment',
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: postimage.length,
      ));





  }
}
