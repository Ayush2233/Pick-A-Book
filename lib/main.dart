import 'package:firebase_core/firebase_core.dart';
import 'package:project2/models/connection.dart';

import 'package:splash_view/splash_view.dart';
import 'screens/splashscreen.dart';
import 'package:project2/screens/completeProfile.dart';
import 'screens/splashscreen.dart';
import 'package:project2/screens/navigationcontroller.dart';
import 'package:project2/screens/signin.dart';

import 'package:project2/screens/sellSearch.dart';

import 'package:project2/utilities/check.dart';
import 'package:flutter/material.dart';
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
        home: SplashView(
            logo: Splashscreen(),
            backgroundColor: Colors.white,
            loadingIndicator: CircularProgressIndicator(),
            done: Done(Check())
        ),
        routes: {
          "/sellSearch" : (context) => sellSearch(),
          "/completeProfile": (context) => completeProfile(),
        },
      );
    }
    );
}
}
