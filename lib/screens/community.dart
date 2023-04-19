import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/data.dart';
import 'package:project2/screens/postUpload.dart';
import 'package:project2/widgets/postCard.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/postDisplayModel.dart';
// import 'package:mongo_dart/mongo_dart.dart';






class community extends StatefulWidget {
  const community({Key? key}) : super(key: key);

  @override
  State<community> createState() => _communityState();
}


class _communityState extends State<community> {

  var postFuture ;



  @override
  void initState() {
    postFuture = MongoDatabase.fetchPost();
    super.initState();
  }
  @override






  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.pushNamed(context,'/post');
        },
        backgroundColor: Color(0xffDE6077),
        child: Icon(Icons.add),
      ),


      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,8,0,8),
        child: RefreshIndicator(

          onRefresh: () async
          {
            var x= MongoDatabase.fetchPost();
            setState(()
            {
              postFuture = x;
            });
          },

          child: FutureBuilder(

            future: postFuture,

              builder: (context , AsyncSnapshot snapshot){
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
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index)
                        {
                          return postCard(PostDisplay1.fromJson(snapshot.data[index]),context);
                        }
                    );
                  }
                  else
                  {
                    return Center(child: Text('No Data Available'),);
                  }
                }

          }),
        ),
      )
    );






  }
}
