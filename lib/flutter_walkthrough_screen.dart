// Copyright 2013 Tushar Nikam. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library walkthrough_screen;

import 'package:flutter/material.dart';

class OnbordingData extends StatelessWidget {
  ///Contain the list of ImageProvider such as Network Asset,SVG etc Images
  final ImageProvider<Object> image;

  ///Title text
  final Widget titleText;

  ///Description of the `walkthrough`
  final Widget descText;

  /// Height of the image Default is `MediaQuery.of(context).size.height * 0.5`
  final double? imageHeight;

  ///Width of the image default is `MediaQuery.of(context).size.width`
  final double? imageWidth;

  ///Default is BoxFit.cover
  final BoxFit? fit;

  ///Default padding is `EdgeInsets.symmetric(horizontal: 8.0)`,
  final EdgeInsetsGeometry? titlePadding;

  ///Default padding is `EdgeInsets.symmetric(horizontal: 8.0)`,
  final EdgeInsetsGeometry? descPadding;

  const OnbordingData({
    Key? key,
    required this.image,
    required this.titleText,
    required this.descText,
    this.imageHeight,
    this.imageWidth,
    this.fit,
    this.titlePadding,
    this.descPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 18.0),
          Padding(
              padding: titlePadding == null
                  ? EdgeInsets.symmetric(horizontal: 8.0)
                  : titlePadding!,
              child: Wrap(
                children: [
                  titleText,
                ],
              )),
          Image(
            fit: fit == null ? BoxFit.cover : fit,
            width: imageWidth == null
                ? MediaQuery.of(context).size.width
                : imageWidth,
            height: imageHeight == null
                ? MediaQuery.of(context).size.height * 0.5
                : imageHeight,
            image: image,
          ),
          Padding(
              padding: descPadding == null
                  ? EdgeInsets.symmetric(horizontal: 8.0)
                  : descPadding!,
              child: Wrap(
                children: [
                  descText,
                ],
              )),
        ],
      ),
    );
  }
}

/// A IntroScreen Class.
class IntroScreen extends StatefulWidget {
  ///contain list of Onbording screen data such as
  ///OnbordingData(
  //       image: AssetImage("images/pic3.png"),
  //       fit: BoxFit.cover,
  //       imageHeight: 250,
  //       titleText: RichText(
  //         textAlign: TextAlign.center,
  //         text: TextSpan(
  //           children: [
  //             TextSpan(
  //                 text: "Pickup delivery at \nyour ",
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 20.0,
  //                 )),
  //             TextSpan(
  //               text: "door ! ",
  //               style: TextStyle(
  //                   color: Colors.orange,
  //                   fontSize: 22.0,
  //                   fontWeight: FontWeight.w500),
  //             ),
  //           ],
  //         ),
  //       ),
  //       descText: RichText(
  //         textAlign: TextAlign.center,
  //         text: TextSpan(
  //           children: [
  //             TextSpan(
  //               text:
  //               "Even to space with us! Together, pickup delivery at your home ",
  //               style: TextStyle(
  //                 color: Colors.grey,
  //                 fontSize: 17.0,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       descPadding: EdgeInsets.symmetric(horizontal: 22.0),
  //     ),
  final List<OnbordingData> onbordingDataList;

  ///
  final MaterialPageRoute? pageRoute;

  ///
  final List<Color> colors;

  ///
  final Widget nextButton;

  ///
  final Widget lastButton;

  ///
  final Widget skipButton;

  ///
  final Color? selectedDotColor;

  ///
  final Color? unSelectdDotColor;

  ///
  final Gradient? gradient;

  IntroScreen(
      {required this.onbordingDataList,
      this.pageRoute,
      required this.colors,
      this.selectedDotColor,
      this.unSelectdDotColor,
      this.gradient,
      required this.nextButton,
      required this.lastButton,
      required this.skipButton});

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute!);
  }

  @override
  IntroScreenState createState() {
    return new IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage
            ? (widget.selectedDotColor == null
                ? Colors.blue
                : widget.selectedDotColor)
            : (widget.unSelectdDotColor == null
                ? Colors.grey
                : widget.unSelectdDotColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: widget.gradient == null
              ? LinearGradient(colors: [
                  Colors.white,
                  Colors.white,
                ])
              : widget.gradient,
          color: widget.colors.length < widget.onbordingDataList.length
              ? Colors.white
              : widget.colors[currentPage],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 15,
              child: new PageView(
                children: widget.onbordingDataList,
                controller: controller,
                onPageChanged: _onPageChanged,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: lastPage ? Text("") : widget.skipButton,
                    onPressed: () => lastPage
                        ? null
                        : widget.skipPage(
                            context,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      child: Row(
                          children: List.generate(
                              widget.onbordingDataList.length,
                              (index) => _buildPageIndicator(index))),
                    ),
                  ),
                  TextButton(
                    child: lastPage ? widget.lastButton : widget.nextButton,
                    onPressed: () => lastPage
                        ? widget.skipPage(context)
                        : controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
