import 'package:flutter/widgets.dart';

double smallestScreenWidthSize(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  var width = screenSize.width;
  var height = screenSize.height;
  if (width >= height) {
    return height;
  } else {
    return width;
  }
}

