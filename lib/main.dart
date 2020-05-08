import 'package:flutter/material.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shubham Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<Widget> appbarAction() {
    return <Widget>[
      FlatButton(onPressed: () {}, child: Text("Home")),
      Container(
        width: 10,
      ),
      FlatButton(onPressed: () {}, child: Text("About")),
      Container(
        width: 10,
      ),
      FlatButton(onPressed: () {}, child: Text("Contact")),
      Container(
        width: 50,
      )
    ];
  }

  Widget myDrawer(BuildContext context) {
    return ResponsiveWidget.issmallScreen(context)
        ? Drawer(
            child: ListView(children: appbarAction()),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        actions:
            !ResponsiveWidget.issmallScreen(context) ? appbarAction() : null,
      ),
      body: ResponsiveWidget.islargeScreen(context) ||
              ResponsiveWidget.ismediumScreen(context)
          ? Container(
              color: Colors.white,
            )
          : Container(
              color: Colors.red,
            ),
    );
  }
}
