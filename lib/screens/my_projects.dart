import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/hover_effect/image_hover.dart';
import 'package:my_test_web_app/hover_effect/mouse_hover.dart';
import 'package:my_test_web_app/hover_effect/slide_right_left.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';

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

  var jsonResult = [];

  myProjectsData() async {
    var data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");

    setState(() {
      jsonResult = json.decode(data);
    });
  }

  List<Widget> aboutMe(BuildContext context) {
    return <Widget>[
      Text(
        "Hello",
        style: GoogleFonts.breeSerif(
            color: Colors.black,
            fontSize: !ResponsiveWidget.issmallScreen(context) ? 20 : 14),
      ),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: ImageHover())),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color textColor = Colors.black;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/b2.jpg",
                ),
                fit: BoxFit.contain)),
        child: Column(
          // shrinkWrap: true,
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
                      "Projects!",
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

            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: jsonResult.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       height: 100,
            //       width: 100,
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: <Widget>[
            //           Text(jsonResult[index]['user_name']),
            //           // Image.network(jsonResult[index]['user_image'])
            //         ],
            //       ),
            //     );
            //   },
            // )
            Container(
                height: !ResponsiveWidget.issmallScreen(context)
                    ? height / 1.5
                    : height / 1.4,
                child: !ResponsiveWidget.issmallScreen(context)
                    ? Row(
                        children: aboutMe(context),
                      )
                    : Expanded(
                        child: ListView(
                        shrinkWrap: true,
                        children: aboutMe(context),
                      ))),
          ],
        ),
      ),
    );
  }
}
