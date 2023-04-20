import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project2/models/app_to_db.dart';
import 'package:project2/models/connection.dart';

class postUpload extends StatefulWidget {
  const postUpload({Key? key}) : super(key: key);

  @override
  State<postUpload> createState() => _postUploadState();
}

class _postUploadState extends State<postUpload> {
  var postFuture ;
  XFile? imagefile;
  final ImagePicker picker = ImagePicker();
  Reference root = FirebaseStorage.instance.ref();
  final _caption = TextEditingController();
  String url = "";
  String imageurl ="";

  @override

  void dispose()
  {
    _caption.dispose();
    super.dispose();
  }

  Future<String?> uploadImage() async{

    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    String unique = DateTime.now().microsecondsSinceEpoch.toString();
    Reference Posts = root.child("posts");
    Reference postImage = Posts.child(unique);
    if (file == null)
    {
      return null;
    }
    await postImage.putFile(File(file.path));
    url = await postImage.getDownloadURL();

    setState(() {
      imagefile=file;
    });
    print(imagefile);
    return url;
  }

  Widget build(BuildContext context)
  {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

      actions: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start
          ,children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("  Upload Image",style: TextStyle(fontWeight: FontWeight.w700),),

                IconButton(
                    onPressed: () {
                      uploadImage();
                    },
                    icon: Icon(Icons.camera_alt)),

              ],
            ),

            // imagefile==null?Container(
            //     width: double.infinity,
            //     height: 200,
            //     color: Colors.pink[100],
            //
            //     child: Text("Add Image"),
            //   ):Image(image: FileImage(File(imagefile!.path)))

            Container(
              width: double.infinity,
              height: 200,
              color: Colors.pink[100],

              child: imagefile ==null? Text("Add Image"):Image(image: FileImage(File(imagefile!.path))),
            ),

            // SHOW IMAGE
            // FutureBuilder(
            // future : uploadImage()
            // ,builder: (BuildContext context, AsyncSnapshot snapshot)
            // {
            //   if(snapshot.connectionState==ConnectionState.waiting)
            //     {
            //       return Center(
            //         child: CircularProgressIndicator(),);
            //     }
            //   else{
            //     if(snapshot.hasData){
            //       return Container(
            //         width: double.infinity,
            //         height: 200,
            //         color: Colors.pink[100],
            //         child: Image.network(imageurl),
            //       );
            //     }
            //     else{
            //       return Container(
            //         width: double.infinity,
            //         height: 200,
            //         color: Colors.pink[100],
            //         child: Center(child: Text('Add image')),
            //       );
            //     }
            //   }
            // }),



            SizedBox(height: 20,),
            Text("  Add Caption",style: TextStyle(fontWeight: FontWeight.w700),),

            TextField(
              controller: _caption,
              maxLines: null,
            ),


            SizedBox(height: 20,),

            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Color(0xffDE6077),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: (){
                  insertPost(Fireuser.uid, url, _caption.text.trim(),0,DateTime.now());
                  Navigator.pop(context);
                },
                child: Text("Submit",style: TextStyle(color: Colors.white),),
              ),
            )


          ],)
      ],
    );


  }
}
