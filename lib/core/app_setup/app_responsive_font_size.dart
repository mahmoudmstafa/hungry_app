


import 'package:flutter/material.dart';

abstract class ResponsiveText {
  const ResponsiveText._();

  static double fontSize(
      BuildContext context, {
        required double fontSize,
      }) {
    double responsiveFontSize = fontSize * scaleFactor(context);

    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double scaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return width / 500;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }
}