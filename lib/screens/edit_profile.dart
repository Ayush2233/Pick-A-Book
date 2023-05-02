
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:project2/models/connection.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var userData;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  var _gender;
  final List<String> _genderOptions = ['Male', 'Female'];

  @override
  void initState() {
    userData = MongoDatabase.fetchUser();
    print(userData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: userData,
            builder: (context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                    child: Column(
                      children: [
                        Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    ),
                                child: Initicon(
                                  text: data.email,style: TextStyle(color: Colors.white,fontSize: 50),
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Colors.white,
                                      ),
                                      color: Colors.pinkAccent,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          Fireuser.email.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.titleSmall!.color),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).textTheme.titleSmall!.color,
                          ),
                          controller: _name,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            floatingLabelBehavior: FloatingLabelBehavior
                                .always, // make label stay at top
                            labelStyle: TextStyle(
                              color: Theme.of(context).textTheme.titleSmall!.color,
                            ),
                            hintText: data.name ?? "Enter Your Name",
                            hintStyle: TextStyle(
                              color: Theme.of(context).textTheme.titleSmall!.color,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          style: TextStyle(
                              color: Theme.of(context).textTheme.titleSmall!.color),
                          controller:_age,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Age',
                            labelStyle: TextStyle(
                                color: Theme.of(context).textTheme.titleSmall!.color),
                            hintText: (data.age ?? "Enter Your Age").toString(),
                            hintStyle: TextStyle(
                              color: Theme.of(context).textTheme.titleSmall!.color,
                            ),
                            prefixIcon: Icon(
                              Icons.person_pin_sharp,
                              color: Theme.of(context).iconTheme.color,
                            ), // Set the desired background color
                          ),
                        ),
                        SizedBox(height: 5,),
                        DropdownButtonFormField<String>(
                          style: TextStyle(
                              color: Theme.of(context).textTheme.titleSmall!.color),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                color: Theme.of(context).textTheme.titleSmall!.color),
                            labelText: 'Gender',
                            hintText: data.gender ?? "Select your gender",
                            hintStyle: TextStyle(
                              color: Theme.of(context).textTheme.titleSmall!.color,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          value: _gender,
                          items: _genderOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color:
                                    // Theme.of(context).indicatorColor
                                    Theme.of(context).cardColor),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _gender = value;

                            });
                          },
                          // controller: _genderController,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                              ),
                              child: Text("CANCEL",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.white)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                try {
                                  MongoDatabase.updateUserData(
                                      _name.text.trim(),
                                      _age.text.trim(), _gender);
                                }catch(e){
                                  print(e);
                                }
                                Navigator.pop(context);

                              },
                              style:ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                              ),
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return Text("No data");
                }
              }
            }),
      ),
    );
  }
}
