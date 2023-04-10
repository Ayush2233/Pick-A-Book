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
  Reference root = FirebaseStorage.instance.ref();
  final _caption = TextEditingController();
  String url = "";
  @override
  void dispose() {
    _caption.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload the image"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Upload image"),
          TextField(
            controller: _caption,
          ),
          IconButton(onPressed: () async{
            ImagePicker picker = ImagePicker();
            XFile? file = await picker.pickImage(source: ImageSource.gallery);
            String unique = DateTime.now().microsecondsSinceEpoch.toString();
            Reference Posts = root.child("posts");
            Reference postImage = Posts.child(unique);
            if (file == null) return;
            await postImage.putFile(File(file.path));
            url = await postImage.getDownloadURL();
          }, icon: Icon(Icons.camera_alt)),

          TextButton(onPressed: (){
            insertPost(Fireuser.uid, url, _caption.text.trim());
            Navigator.pop(context);
          }, child: Text("Submit")),
        ],
      ),
    )
    );
  }
}
