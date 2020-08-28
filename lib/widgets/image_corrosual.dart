import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/flutter.png',
  'assets/android.png',
  'assets/ios.png',
  'assets/angular.png',
  'assets/js.png',
];

class VerticalCorrosual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.vertical,
        autoPlay: true,
      ),
      items: imageSliders,
    ));
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(
                item,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ))
    .toList();
