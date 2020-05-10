
import 'package:flutter/material.dart';

class ImageHover extends StatefulWidget {
  @override
  _ImageHoverState createState() => _ImageHoverState();
}

class _ImageHoverState extends State<ImageHover> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = Offset(0,0);
  Color myColor = Colors.transparent;
  BorderRadius borderRadius = BorderRadius.all(Radius.circular(40));
  @override
  Widget build(context) {
    return InkWell(
      onTap: (){},
      onHover: (value){
        print(value);
        if(value){
          setState((){
            elevation = 4.0;
            scale = 1.5;
            translate = Offset(0,0);
            borderRadius = BorderRadius.all(Radius.circular(10));
            myColor = Colors.red;
          });
        }else{
          setState((){
            elevation = 0.0;
            scale = 1.0;
            translate = Offset(0,0);
            myColor = Colors.transparent;
            borderRadius = BorderRadius.all(Radius.circular(40));
          });
        }
      },
      child: Transform.translate(
        offset: translate ,
        child: Transform.scale(
          scale: scale,
          child: Material(
            elevation: elevation,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: borderRadius
              ),
              child:ClipRRect(
                borderRadius: borderRadius,
                child: Image.network(
                  'https://i.ytimg.com/vi/acm9dCI5_dc/maxresdefault.jpg',
                  fit: BoxFit.fill,
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}