import 'package:flutter/material.dart';
import 'package:project2/models/connection.dart';


class bookmark extends StatefulWidget {
  const bookmark({Key? key}) : super(key: key);

  @override
  State<bookmark> createState() => _bookmarkState();
}
var data;


class _bookmarkState extends State<bookmark> {
  @override

  void initState() {
    data=MongoDatabase.fetchHistorybooks();
    // TODO: implement initState

    super.initState();
  }
  Widget build(BuildContext context) {


    return Scaffold(

        body: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context,index)
                {
                  return Divider(height:30, thickness: 0.5,color: Colors.black,);
                  },
                itemBuilder: (context,index){
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                              boxShadow:[BoxShadow(
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
                              Text("Hello",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                              SizedBox(height: 10,),

                              Text("Hello",style: TextStyle(fontSize: 15),),

                              SizedBox(height: 10,),

                              Text('⭐   4.5 ',style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                        SizedBox(width: 130,),
                        Container(child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),)
                  ],
                ),
              );
            },
          )


    );
  }
}
