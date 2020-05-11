import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/hover_effect/image_hover.dart';
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
              "Hello 👋 I'm Shubham Narkhede, a Google Developer Expert for Flutter, Dart & Web Tech. I am also a youtuber having MTechViral youtube channel where I make tutorials for technology. To the outside world I am just an ordinary software developer but secretly with the help of my MacBook I fight bugs and create awesome content for the community. When I was a child I didn’t have many resources to learn new things so I decided to make a channel to help others in learning new awesome things. And I’ll continue to become the better version of myself.",style: GoogleFonts.breeSerif(
                        color: Colors.black,
                        // decoration: TextDecoration.underline,
                        fontSize: !ResponsiveWidget.issmallScreen(context) ? 20 : 14),),
        ),
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: ImageHover()
      )),
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
          // height: height,
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: !ResponsiveWidget.issmallScreen(context)
                      ? height * 0.1
                      : height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: InkWell(
                  onHover: (value) {
                    if (value) {
                      setState(() {
                        textColor = Colors.red;
                      });
                    } else {
                      setState(() {
                        textColor = Colors.black;
                      });
                    }
                  },
                  child: Text(
                    "About me!",
                    style: GoogleFonts.breeSerif(
                        color: textColor,
                        decoration: TextDecoration.underline,
                        fontSize: 24),
                  ),
                ),
              ),
              // ResponsiveWidget(
              //   largeScreen: Row(
              //     children: aboutMe(context),
              //   ),
              //   smallScreen: ListView(
              //     scrollDirection: Axis.vertical,
              //     children: aboutMe(context),
              //   ),
              // )
              Container(
                  height: !ResponsiveWidget.issmallScreen(context)
                      ? height / 1.5
                      : height / 1.4,
                  child: !ResponsiveWidget.issmallScreen(context)
                      ? Row(
                          children: aboutMe(context),
                        )
                      : Column(
                          children: aboutMe(context),
                        ))
            ],
          ),
        ),
      )),
    );
  }
}
