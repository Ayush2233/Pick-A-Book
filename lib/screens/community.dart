import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/data.dart';
import 'package:project2/screens/postUpload.dart';
import 'package:project2/widgets/postCard.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/models/postDisplayModel.dart';

// import 'package:mongo_dart/mongo_dart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project2/models/app_to_db.dart';
import 'dart:io';
import 'package:cupertino_icons/cupertino_icons.dart';

class community extends StatefulWidget {
  const community({Key? key}) : super(key: key);

  @override
  State<community> createState() => _communityState();
}

class _communityState extends State<community> {
  var postFuture;

  XFile? imagefile;
  final ImagePicker picker = ImagePicker();
  Reference root = FirebaseStorage.instance.ref();
  final _caption = TextEditingController();
  String url = "";
  String imageurl = "";

  void dispose() {
    _caption.dispose();
    super.dispose();
  }

  @override
  void initState() {
    postFuture = MongoDatabase.fetchPost();
    super.initState();
  }

  Future<String?> uploadImage() async {
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    String unique = DateTime.now().microsecondsSinceEpoch.toString();
    Reference Posts = root.child("posts");
    Reference postImage = Posts.child(unique);
    if (file == null) {
      return null;
    }
    await postImage.putFile(File(file.path));
    url = await postImage.getDownloadURL();

    setState(() {
      imagefile = file;
    });
    return url;
  }

  void showInformationDialogue(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          XFile? temp;
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: 450,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Upload Image",
                            style: GoogleFonts.montserrat(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () async {
                                XFile? file = await picker.pickImage(
                                    source: ImageSource.gallery);
                                String unique = DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString();
                                Reference Posts = root.child("posts");
                                Reference postImage = Posts.child(unique);
                                if (file == null) {
                                  return null;
                                }
                                await postImage.putFile(File(file.path));
                                url = await postImage.getDownloadURL();

                                setState(() {
                                  temp = file;
                                });
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              )),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Theme.of(context).primaryColor,
                        child: temp == null
                            ? Center(
                                child: Text(
                                "Please select an image",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                            : Image(
                                image: FileImage(
                                File(temp!.path),
                              )),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Text(
                        "  Add Caption",
                        style: GoogleFonts.montserrat(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.bold),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 60,
                          child: TextField(
                            controller: _caption,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor))),
                            maxLines: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Center(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                          ),
                          onPressed: () {
                            insertPost(Fireuser.uid, url, _caption.text.trim(),
                                0, DateTime.now());
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Post",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context,'/post');
            showInformationDialogue(context);
          },
          backgroundColor: Color(0xffDE6077),
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: RefreshIndicator(
            onRefresh: () async {
              var x = MongoDatabase.fetchPost();
              setState(() {
                postFuture = x;
              });
            },
            child: FutureBuilder(
                future: postFuture,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return postCard(
                                PostDisplay1.fromJson(snapshot.data[index]),
                                context);
                          });
                    } else {
                      return Center(
                        child: Text('No Data Available'),
                      );
                    }
                  }
                }),
          ),
        ));
  }
}
