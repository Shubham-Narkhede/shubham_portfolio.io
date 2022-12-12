import 'package:flutter/material.dart';
import 'package:my_test_web_app/responsive_widget/responsive_widget.dart';
import 'package:my_test_web_app/widgets/pageview_ui.dart';

void main() {
  runApp(MyApp(
    initialPage: 0,
  ));
}

class MyApp extends StatelessWidget {
  int initialPage;
  MyApp({required this.initialPage});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shubham Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        initialPage: initialPage,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int initialPage;
  MyHomePage({required this.initialPage});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        body: MainPage(initialPage: widget.initialPage),
      ),
    );
  }
}
