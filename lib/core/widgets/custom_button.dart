import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    required this.backgroundColor,
    this.textColor,
    this.width,
    this.height, this.padding, this.margin,
  });

  final VoidCallback? onTap;

  final String text;
  final Color backgroundColor;
  final Color? textColor;

  final double? width, height;

  final EdgeInsetsGeometry? padding ;
  final EdgeInsetsGeometry? margin ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: padding,
        margin: margin ,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
