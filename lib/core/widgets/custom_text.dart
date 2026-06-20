import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.fontFamily, this.textAlign, this.overflow,
  });

  final String text;

  final double? fontSize;

  final int? color;

  final FontWeight? fontWeight;

  final String? fontFamily;
  final TextAlign? textAlign;

  final TextOverflow? overflow ;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      textAlign: textAlign,
      text,
      style: TextStyle(
        color: Color(
          color ?? 0xff6A6A6A,
        ),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
