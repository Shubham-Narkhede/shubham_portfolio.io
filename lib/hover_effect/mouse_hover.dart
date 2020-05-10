import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;


class HandCursor extends MouseRegion {

   static final appContainer = html.window.document.getElementById('app-container');

  HandCursor({Widget child}) : super(

      onHover: (PointerHoverEvent evt) {
        appContainer.style.cursor='pointer';
        appContainer.style.color= "red" ;
         // 'help', 'wait', 'move', 'crosshair', 'text' or 'pointer'
        // more options/details here: http://www.javascripter.net/faq/stylesc.htm
      },
      onExit: (PointerExitEvent evt) {
         appContainer.style.cursor='default';
      },
      child: child
  );

}
