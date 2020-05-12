import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/hover_effect/image_hover.dart';
import 'package:my_test_web_app/hover_effect/mouse_hover.dart';
import 'package:my_test_web_app/hover_effect/slide_left_right.dart';
import 'package:my_test_web_app/hover_effect/slide_right_left.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';

class AboutMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AboutMe();
  }
}

class _AboutMe extends State<AboutMe> {
  List<Widget> aboutMe(BuildContext context) {
    return <Widget>[
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Hello 👋 I'm Shubham Narkhede, mobile application developer(Flutter, Android and IOS). I am also a youtuber having TurnToStudy youtube channel where I make tutorials for technology like flutter and IOT also. I'm also a Quotes writer and story writer which are published on pratilipi and YourQuotes app.Also write articles related to flutter on Medium. And I would like to be part of an organizaton where I could use and enhance my knowledge and talent for the development of both the organizaton and myself. I liked to enagage with people who likes to learn new new technologies.",
            style: GoogleFonts.breeSerif(
                color: Colors.black,
                // decoration: TextDecoration.underline,
                fontSize: !ResponsiveWidget.issmallScreen(context) ? 20 : 14),
          ),
        ),
      ),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: ImageHover())),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color textColor = Colors.black;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background.png",
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:
                  !ResponsiveWidget.issmallScreen(context) ? height * 0.1 : 1,
            ),
            HandCursor(
              child: SlideRightLeft(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: FlatButton(
                    onPressed: () {},
                    hoverColor: Colors.red,
                    child: Text(
                      "About me!",
                      style: GoogleFonts.breeSerif(
                          color: textColor,
                          decoration: TextDecoration.underline,
                          fontSize: 24),
                    ),
                  ),
                ),
                delay: 1,
              ),
            ),
            SlideLeftRight(
              child: Container(
                  height: !ResponsiveWidget.issmallScreen(context)
                      ? height / 1.5
                      : height / 1.4,
                  child: !ResponsiveWidget.issmallScreen(context)
                      ? Row(
                          children: aboutMe(context),
                        )
                      : Column(
                          children: aboutMe(context),
                        )),
              delay: 1,
            ),
          ],
        ),
      ),
    );
  }
}
