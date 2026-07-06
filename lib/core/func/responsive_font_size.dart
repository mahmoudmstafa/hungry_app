import 'dart:developer';

import 'package:flutter/material.dart';

double responsiveFontSize(
  BuildContext context, {
  required double fontSize,
}) {
  double responsiveFontSize = fontSize * scaleFactor(context);

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double scaleFactor(
  BuildContext context,
) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 500;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
//
// log('fontSize --> ${fontSize.round()} and lowerLimit --> ${lowerLimit.round()} and upperLimit --> ${upperLimit.round()} and responsiveFontSize --> ${responsiveFontSize.round()} and Font is --> ${responsiveFontSize.clamp(lowerLimit, upperLimit).round()}');
