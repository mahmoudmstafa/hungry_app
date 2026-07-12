

import 'package:flutter/material.dart';



class CustomCircleLoading extends StatelessWidget {
  const CustomCircleLoading({
    super.key, this.color = Colors.black,  this.height = 30,  this.width = 30 ,
  });

  final Color color ;
  final double height ;
  final double width ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
