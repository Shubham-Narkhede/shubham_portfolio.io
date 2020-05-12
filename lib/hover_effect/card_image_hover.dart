import 'package:flutter/material.dart';

class ImageHoverEffect extends StatefulWidget {
  Widget child;
  ImageHoverEffect({this.child});
  @override
  _ImageHoverEffectState createState() => _ImageHoverEffectState();
}

class _ImageHoverEffectState extends State<ImageHoverEffect> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = Offset(0, 0);
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        // print(value);
        if (value) {
          setState(() {
            elevation = 20.0;
            scale = 1;
            translate = Offset(-5, -5);
          });
        } else {
          setState(() {
            elevation = 4.0;
            scale = 1.0;
            translate = Offset(0, 0);
          });
        }
      },
      child: Transform.translate(
        offset: translate,
        child: Transform.scale(
          scale: scale,
          child: Material(
            elevation: elevation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
