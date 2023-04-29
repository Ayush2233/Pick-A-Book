import 'package:flutter/material.dart';
import 'package:project2/utilities/check.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Container(
                  // margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Discover_books.jpg', width: 300),
                      SizedBox(height: 100),
                      Text(
                        "Discover Your Next Favorite Book",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "  Get personalized book recommendations   \n based on your preferences.  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Community.png', width: 400),
                      SizedBox(height: 100),
                      Text(
                        "Join Our Community",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Connect with other book lovers, share your thoughts and find inspiration.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Book_Exchange.png',
                        width: 300,
                      ),
                      SizedBox(height: 100),
                      Text(
                        "Share Books",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Share your books with fellow book lovers.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 40),
                      Container(
                        // color: Colors.pinkAccent,
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            setState(() {
                              initScreen =1;
                            });
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Check()));

                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Container(
                alignment: Alignment(0, 0.75),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                    radius: 4.0,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.pink,
                    dotWidth: 9.0,
                    dotHeight: 11.0,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}