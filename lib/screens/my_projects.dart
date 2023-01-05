import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/hover_effect/card_hover.dart';
import 'package:my_test_web_app/hover_effect/card_image_hover.dart';
import 'package:my_test_web_app/hover_effect/mouse_hover.dart';
import 'package:my_test_web_app/hover_effect/slide_right_left.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyProjects();
  }
}

class _MyProjects extends State<MyProjects> {
  @override
  initState() {
    setState(() {
      myProjectsData();
    });
    super.initState();
  }

  List<dynamic>? projctsData = [];

  myProjectsData() async {
    var data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");

    setState(() {
      var jsonResult = json.decode(data);
      projctsData = jsonResult['projects'];
    });
  }

  launchURLAPp(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $launchUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color textColor = Colors.black;
    return Container(
      height: height,
      // decoration: decoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
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
                  // hoverColor: Colors.red,
                  child: Text(
                    "Projects!",
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
          Container(
            height: !ResponsiveWidget.isSmallScreen(context)
                ? height / 1.5
                : height / 1.4,
            child: !ResponsiveWidget.isSmallScreen(context)
                ? Center(
                    child: Container(
                      width: width / 1.1,
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 100, bottom: 100),
                        scrollDirection: Axis.horizontal,
                        itemCount: projctsData!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HoverEffect(
                              child: Column(
                            children: [
                              Container(
                                height: height / 4,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: width / 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 6, bottom: 4),
                                            child: Text(
                                              projctsData![index]
                                                  ['project_name'],
                                              style: GoogleFonts.josefinSans(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                projctsData![index]
                                                    ['project_desc'],
                                                style: GoogleFonts.roboto(
                                                    color:
                                                        Colors.grey.shade200),
                                              ),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: ImageHoverEffect(
                                        child: ClipRRect(
                                          child: Image.network(
                                              projctsData![index]
                                                  ['project_image']),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          launchURLAPp(projctsData![index]
                                              ['project_link']);
                                        },
                                        child: Text("Android")),
                                    Container(
                                      width: 20,
                                    ),
                                    if (projctsData![index]['ios'].isNotEmpty)
                                      Center(
                                        child: TextButton(
                                            onPressed: () {
                                              launchURLAPp(
                                                projctsData![index]['ios'],
                                              );
                                            },
                                            child: Text(
                                              "IOS",
                                              textAlign: TextAlign.center,
                                            )),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 10,
                          );
                        },
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(right: 30, left: 30),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: projctsData!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: height / 4,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: width / 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 6, bottom: 4),
                                        child: Text(
                                          projctsData![index]['project_name'],
                                          style: GoogleFonts.josefinSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            projctsData![index]['project_desc'],
                                            style: GoogleFonts.roboto(
                                                color: Colors.grey.shade200),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: ClipRRect(
                                    child: Image.network(
                                        projctsData![index]['project_image']),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      launchURLAPp(
                                          projctsData![index]['project_link']);
                                    },
                                    child: Text("Android")),
                                Container(
                                  width: 20,
                                ),
                                if (projctsData![index]['ios'].isNotEmpty)
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          launchURLAPp(
                                            projctsData![index]['ios'],
                                          );
                                        },
                                        child: Text(
                                          "IOS",
                                          textAlign: TextAlign.center,
                                        )),
                                  )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 10,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration decoration() {
  return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            "assets/mobileBg.png",
          ),
          fit: BoxFit.fill));
}
