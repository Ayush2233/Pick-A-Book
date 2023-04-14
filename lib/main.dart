import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/community.dart';
import 'package:project2/screens/postUpload.dart';
import 'package:project2/utilities/authpage.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/screens/completeProfile.dart';
import 'package:project2/screens/navigationcontroller.dart';
import 'package:project2/screens/signin.dart';
import 'package:project2/utilities/check.dart';
import 'screens/Home.dart';
import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Search.dart';
import 'screens/sign up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities/apptheme.dart';
import 'utilities/appstartnotifier.dart';
import 'package:provider/provider.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MongoDatabase.connect();

  runApp(
      ChangeNotifierProvider<AppStateNotifier>
          (
        create: (context) => AppStateNotifier(),
        child: app(),)
  );

  //
  // runApp(MaterialApp(
  //   home: Check(),
  //   theme: ThemeClass.lightTheme,
  //   darkTheme: ThemeClass.darkTheme,
  //   // darkTheme: ThemeData.dark(),
  //
  //   routes: {
  //     '/post': (context) => postUpload(),
  //     '/community' : (context) => community(),
  //   },
  //
  //   debugShowCheckedModeBanner: false,
  // ));
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child)
    {
      return MaterialApp(
        title: 'Pick-A-Book',
        debugShowCheckedModeBanner: false,
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: appState.isDarkModeon ? ThemeMode.dark : ThemeMode.light,
        home: Check(),
      );
    }
    );
}
}
