import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';
import 'package:my_test_web_app/widgets/image_corrosual.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  launchURL(var launchUrl) async {
    const url = 'https://flutter.dev';
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/port_b.png",
              ),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hiii, I'm Shubham Narkhede!",
            style: GoogleFonts.averiaSansLibre(
                color: Color(0Xff0073AA),
                fontSize: ResponsiveWidget.islargeScreen(context) ||
                        ResponsiveWidget.ismediumScreen(context)
                    ? 60
                    : 24,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: height * 0.03,
          ),
          Container(
            width: ResponsiveWidget.islargeScreen(context) ||
                    ResponsiveWidget.ismediumScreen(context)
                ? width / 7
                : width / 3,
            height: ResponsiveWidget.islargeScreen(context) ||
                    ResponsiveWidget.ismediumScreen(context)
                ? height / 3
                : height / 3,
            child: VerticalCorrosual(),
          ),
          Container(
            height: height * 0.03,
          ),
          Center(
            child: Container(
              height: height / 9,
//                width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                      message: "Github",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag1",
                        child: Image.asset("assets/github.png", color: Colors.white,),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL("https://github.com/Shubham-Narkhede");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                  Container(
                    width: width * 0.04,
                  ),
                  Tooltip(
                      message: "Medium",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag2",
                        child: Image.asset("assets/medium.png", color: Colors.white,),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL("https://medium.com/@shubham.narkhede8");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                  Container(
                    width: width * 0.04,
                  ),
                  Tooltip(
                      message: "Twitter",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag3",
                        child: Image.asset("assets/s_3.png"),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL("https://twitter.com/ShubhamNarkhe14");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                  Container(
                    width: width * 0.04,
                  ),
                  Tooltip(
                      message: "Whatsapp",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag4",
                        child: Image.asset("assets/whatsapp.png"),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL(
                              "https://api.whatsapp.com/send?phone=919960889728");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.02,
          ),
          Center(
            child: Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                      message: "LinkedIn",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag5",
                        child: Image.asset("assets/s_4.png"),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL(
                              "https://www.linkedin.com/in/shubham-narkhede-435bb1100");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                  Container(
                    width: width * 0.04,
                  ),
                  Tooltip(
                      message: "Facebook",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag6",
                        child: Image.asset("assets/s_1.png"),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL(
                              "https://www.facebook.com/shubham.narkhede.334");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                  Container(
                    width: width * 0.04,
                  ),
                  Tooltip(
                      message: "Instagram",
                      preferBelow: true,
                      decoration: BoxDecoration(color: Colors.transparent),
                      textStyle: GoogleFonts.roboto(color: Colors.black),
                      child: FloatingActionButton(
                        heroTag: "mytag7",
                        child: Image.asset("assets/s_2.png", height: 60,),
                        hoverColor: Colors.blue,
                        onPressed: () {
                          launchURL(
                              "https://www.instagram.com/_me_._shubham_/");
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
