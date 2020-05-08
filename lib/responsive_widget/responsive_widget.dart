import 'package:flutter/widgets.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  ResponsiveWidget({this.largeScreen, this.mediumScreen, this.smallScreen});

  static bool islargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 768;
  }

  static bool ismediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 768 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool issmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth > 768) {
          return largeScreen;
        } else if (constraint.maxWidth > 425 && constraint.maxWidth < 1200) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
