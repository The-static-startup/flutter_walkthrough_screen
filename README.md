# Flutter Walkthrough Screen


A flutter package which help developer in creating a customize onboarding screens of their app.

 ![Bitbucket open issues](https://img.shields.io/bitbucket/issues-raw/champ96k/flutter_walkthrough_screen)


## Screenshots

![](https://i.ibb.co/L05Kg47/Walkthrough.png)


## Usage


[Example](https://github.com/champ96k/flutter_walkthrough_screen/tree/main/example)

To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/champ96k/flutter-onboarding-screen/blob/master/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    flutter_walkthrough_screen:
```

### How to use

```dart
class TestScreen extends StatelessWidget {
    /*here we have a list of OnbordingScreen which we want to have, each OnbordingScreen have a imagePath,title and an desc.
      */
  final List<OnbordingData> list = [
      OnbordingData(
        image: AssetImage("images/pic1.png"),
        titleText:Text("This is Title1"),
        descText: Text("This is desc1"),
      ),
       OnbordingData(
        image: AssetImage("images/pic2.png"),
        titleText:Text("This is Title2"),
        descText: Text("This is desc2"),
      ),
       OnbordingData(
        image: AssetImage("images/pic3.png"),
        titleText:Text("This is Title3"),
        descText: Text("This is desc4"),
      ),
       OnbordingData(
        image: AssetImage("images/pic4.png"),
        titleText:Text("This is Title4"),
        descText: Text("This is desc4"),
      ),
    ];

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return IntroScreen(
                 onbordingDataList: list,
                 colors: [
                   //list of colors for per pages
                   Colors.white,
                   Colors.red,
                 ],
                 pageRoute: MaterialPageRoute(
                   builder: (context) => NextPage(),
                 ),
                 nextButton: Text(
                   "NEXT",
                   style: TextStyle(
                     color: Colors.purple,
                   ),
                 ),
                 lastButton: Text(
                   "GOT IT",
                   style: TextStyle(
                     color: Colors.purple,
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
```


# Customize your onboarding screen design


Background color             |  Background gradient color
:-------------------------:|:-------------------------:
![](https://i.ibb.co/87Yd36V/background-color.png)  |  ![](https://i.ibb.co/F8GYJSR/background-gradient-color.png)



Last page button             |  Next page button
:-------------------------:|:-------------------------:
![](https://i.ibb.co/5vLg0pG/last-page-button.png)  |  ![](https://i.ibb.co/qmVRSvV/next-page-button.png)


Skip button             |  Define next page route
:-------------------------:|:-------------------------:
![](https://i.ibb.co/f0qRn4C/skip-button.png)  |  ![](https://i.ibb.co/MM9f6Xx/page-route.png)


Selected dot Color             |  Unselected dot Color
:-------------------------:|:-------------------------:
![](https://i.ibb.co/6w344S3/selected-dot-Color.png)  |  ![](https://i.ibb.co/dtpjTD1/unselect-dot-Color.png)



### Created & Maintained By

[Tushar Nikam](http://tusharnikam.ml/)



<p><a href="https://www.twitter.com/champ_96k"><img src="https://img.shields.io/badge/twitter-%231DA1F2.svg?&style=for-the-badge&logo=twitter&logoColor=white" height=25></a> <a href="https://www.linkedin.com/in/tushar-nikam-a29a97131/"><img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" height=25></a> <a href="https://medium.com/@champ96k"><img src="https://img.shields.io/badge/medium-%2312100E.svg?&style=for-the-badge&logo=medium&logoColor=white" height=25></a> <a href="https://champ96k.github.io"><img src="https://img.shields.io/badge/tusharnikam.ml-portfolio-orange" height=25></a> <a href="https://stackoverflow.com/users/11157840/tushar-nikam" target="_blank"><img src="https://logos-download.com/wp-content/uploads/2019/01/Stack_Overflow_Logo-700x283.png" alt="Stackoverflow" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"height=25 ></a>  <a href="https://www.buymeacoffee.com/champ96k" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"height=25 ></a></p>
