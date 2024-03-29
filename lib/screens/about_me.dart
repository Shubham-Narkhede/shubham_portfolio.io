import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/hover_effect/image_hover.dart';
import 'package:my_test_web_app/hover_effect/mouse_hover.dart';
import 'package:my_test_web_app/hover_effect/slide_left_right.dart';
import 'package:my_test_web_app/hover_effect/slide_right_left.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';

import 'my_projects.dart';

class AboutMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutMe();
  }
}

class _AboutMe extends State<AboutMe> {
  List<Widget> aboutMe(BuildContext context) {
    return <Widget>[
      if (ResponsiveWidget.isSmallScreen(context))
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: ImageHover())),
      Expanded(
        flex: !ResponsiveWidget.isSmallScreen(context) ? 2 : 0,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            "Hello 👋 I'm Shubham Narkhede, mobile application developer. Having 3+ years of experience in software industry. In those year I completed almost 12-13 apps👑 which are currently live on app store and play store. Mainly I worked on Flutter technology but having experience of Android(java) as well. Also write articles related to flutter on Medium. And I would like to be part of an organization where I could use and enhance my knowledge and talent for the development of both the organization and myself. I liked to engage with people who likes to learn new new technologies.",
            style: GoogleFonts.breeSerif(
                letterSpacing:
                    ResponsiveWidget.isSmallScreen(context) ? 0.5 : 4,
                color: Colors.white,
                fontSize: !ResponsiveWidget.isSmallScreen(context) ? 20 : 16),
          ),
        ),
      ),
      if (!ResponsiveWidget.isSmallScreen(context))
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: ImageHover())),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: !ResponsiveWidget.isSmallScreen(context) ? height * 0.1 : 1,
          ),
          HandCursor(
            child: SlideRightLeft(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "About me!",
                    style: GoogleFonts.breeSerif(
                        color: Colors.white,
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
                height: !ResponsiveWidget.isSmallScreen(context)
                    ? height / 1.5
                    : height / 1.4,
                child: !ResponsiveWidget.isSmallScreen(context)
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
    );
  }
}
