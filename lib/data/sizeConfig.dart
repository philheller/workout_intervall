import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double textScaleFactor;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    textScaleFactor = _mediaQueryData.textScaleFactor;
    print(
        "Initialized with device data: {width: $screenWidth, height: $screenHeight, textScaleFactor: $textScaleFactor,}");
  }
}
