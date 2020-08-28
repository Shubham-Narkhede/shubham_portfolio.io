import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_test_web_app/hover_effect/mouse_hover.dart';
import 'package:my_test_web_app/main.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';
import 'package:my_test_web_app/screens/about_me.dart';
import 'package:my_test_web_app/screens/home_page.dart';
import 'package:my_test_web_app/screens/my_projects.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  int initialPage;
  MainPage({@required this.initialPage});

  List<Widget> appbarAction(BuildContext context) {
    return <Widget>[
      HandCursor(
        child: FlatButton(
            hoverColor: Colors.blue.shade200,
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => MyApp(initialPage: 0),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
              // Navigator.push(context, ScaleRoute(widget: MyApp(initialPage: 0)));
            },
            child: Text(
              "Home",
              style: GoogleFonts.slabo27px(color: Colors.black),
            )),
      ),
      Container(
        width: 10,
      ),
      HandCursor(
        child: FlatButton(
            hoverColor: Colors.blue.shade200,
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => MyApp(initialPage: 1),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(seconds: 1),
                ),
              );
              // Navigator.push(context, ScaleRoute(widget: MyApp(initialPage: 1)));
            },
            child: Text(
              "About",
              style: GoogleFonts.slabo27px(color: Colors.black),
            )),
      ),
      Container(
        width: 10,
      ),
      HandCursor(
        child: FlatButton(
            hoverColor: Colors.blue.shade200,
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => MyApp(initialPage: 2),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(seconds: 2),
                ),
              );
              // Navigator.push(context, ScaleRoute(widget: MyApp(initialPage: 2)));
            },
            child: Text(
              "Projects",
              style: GoogleFonts.slabo27px(color: Colors.black),
            )),
      ),
      Container(
        width: 10,
      ),
      HandCursor(
        child: FlatButton(
            hoverColor: Colors.blue.shade200,
            onPressed: () {
              launchURL(
                  "https://firebasestorage.googleapis.com/v0/b/nfanfa-84d2e.appspot.com/o/ShubhamNarkhede.pdf?alt=media&token=08db6251-c55b-4e58-998d-384e67721233");
            },
            child: Text(
              "Resume",
              style: GoogleFonts.slabo27px(color: Colors.black),
            )),
      ),
    ];
  }

  launchURL(var launchUrl) async {
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
  }

  Widget myDrawer(BuildContext context) {
    return ResponsiveWidget.issmallScreen(context)
        ? Drawer(
            child: ListView(children: appbarAction(context)),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "My Portfolio",
          style: GoogleFonts.bitter(color: Colors.black),
        ),
        actions: !ResponsiveWidget.issmallScreen(context)
            ? appbarAction(context)
            : null,
      ),
      body: Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: PageController(
            initialPage: initialPage,
          ),
          children: [HomePage(), AboutMe(), MyProjects()],
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;
  ScaleRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.5,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.50,
                    1.00,
                    curve: Curves.ease,
                  ),
                ),
              ),
              child: child,
            ),
          );
        });
}
