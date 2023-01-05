import 'package:flutter/material.dart';

class ImageHover extends StatefulWidget {
  @override
  _ImageHoverState createState() => _ImageHoverState();
}

class _ImageHoverState extends State<ImageHover> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = Offset(0, 0);
  Color myColor = Colors.transparent;
  BorderRadius borderRadius = BorderRadius.all(Radius.circular(40));
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        // print(value);
        if (value) {
          setState(() {
            elevation = 4.0;
            scale = 1.5;
            translate = Offset(0, 0);
            borderRadius = BorderRadius.all(Radius.circular(10));
            myColor = Colors.red;
          });
        } else {
          setState(() {
            elevation = 0.0;
            scale = 1.0;
            translate = Offset(0, 0);
            myColor = Colors.transparent;
            borderRadius = BorderRadius.all(Radius.circular(200));
          });
        }
      },
      child: Material(
          borderRadius: borderRadius,
          elevation: elevation,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/flutter-firebase-361a9.appspot.com/o/WhatsApp%20Image%202023-01-05%20at%207.36.17%20PM.jpeg?alt=media&token=63be9485-cf6b-4102-8e75-cbe02ebc0934',
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
