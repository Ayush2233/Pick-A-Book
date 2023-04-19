import 'package:flutter/material.dart';
import 'package:splash_view/splash_view.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
              "assets/images/Pick-A-Book.gif",
              // height: 300.0,
              // width: 300.0,


      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(),
      //     Center(
      //
      //       child: Image.asset(
      //         "assets/images/Pick-A-Book.gif",
      //         height: 300.0,
      //         width: 300.0,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
