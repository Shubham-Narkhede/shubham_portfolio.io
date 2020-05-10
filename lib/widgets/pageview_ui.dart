import 'package:flutter/material.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';
import 'package:my_test_web_app/screens/home_page.dart';

class MainPage extends StatelessWidget {
  int initialPage;
  MainPage({@required this.initialPage});

  List<Widget> appbarAction(BuildContext context) {
    return <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.push(
                context, ScaleRoute(widget: MainPage(initialPage: 0)));
          },
          child: Text("Home")),
      Container(
        width: 10,
      ),
      FlatButton(
          onPressed: () {
            Navigator.push(
                context, ScaleRoute(widget: MainPage(initialPage: 1)));
          },
          child: Text("About")),
      Container(
        width: 10,
      ),
      FlatButton(
          onPressed: () {
            Navigator.push(
                context, ScaleRoute(widget: MainPage(initialPage: 2)));
          },
          child: Text("Contact")),
      Container(
        width: 50,
      )
    ];
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
        elevation: 0.0,
        backgroundColor: ResponsiveWidget.islargeScreen(context) ||
                ResponsiveWidget.ismediumScreen(context)
            ? Colors.white
            : Colors.red,
        centerTitle: true,
        title: Text(
          "My Portfolio",
          style: TextStyle(color: Colors.black),
        ),
        actions: !ResponsiveWidget.issmallScreen(context)
            ? appbarAction(context)
            : null,
      ),
      body:
      Container(

        child: PageView(
          scrollDirection: Axis.vertical,
          controller: PageController(
            initialPage: initialPage,
           ),
          children: [
            HomePage(),
            Container(color: Colors.purpleAccent),
            Container(color: Colors.greenAccent)
          ],
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
