

import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({
    super.key, required this.errMessage, this.color = const Color(0xFFE57373), this.fontSize = 22,
  });
  final String errMessage ;
  final Color color ;
  final double fontSize ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color ,
          fontSize: fontSize ,
        ),
      ),
    );
  }
}
