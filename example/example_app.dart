import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Walkthrough',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      image: AssetImage("images/pic1.png"),
      fit: BoxFit.cover,
      imageHeight: 290,
      titleText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: "Welcome to ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )),
            TextSpan(
              text: "Foodi ",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
                text: "\nTaste us",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )),
          ],
        ),
      ),
      descText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "our app can send you everywhere even space for only \$ 2.99 per month ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
      descPadding: EdgeInsets.symmetric(horizontal: 22.0),
    ),
    OnbordingData(
      image: AssetImage("images/pic3.png"),
      fit: BoxFit.cover,
      imageHeight: 250,
      titleText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: "Pickup delivery at \nyour ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )),
            TextSpan(
              text: "door ! ",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      descText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "Even to space with us! Together, pickup delivery at your home ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
      descPadding: EdgeInsets.symmetric(horizontal: 22.0),
    ),
    OnbordingData(
      image: AssetImage("images/pic2.png"),
      fit: BoxFit.cover,
      imageHeight: 290,
      titleText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: "Pickup delivery at \nyour ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )),
            TextSpan(
              text: "door ! ",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      descText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "Even to space with us! Together, pickup delivery at your home ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
      descPadding: EdgeInsets.symmetric(horizontal: 22.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      onbordingDataList: list,
      colors: [],
      pageRoute: MaterialPageRoute(
        builder: (context) => NextPage(),
      ),
      lastButton: CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
      nextButton: CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      skipButton: Text(
        "SKIP",
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      selectedDotColor: Colors.orange,
      unSelectdDotColor: Colors.grey,
    );
  }
}
