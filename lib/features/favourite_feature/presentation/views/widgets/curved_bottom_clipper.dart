import 'package:flutter/material.dart';
class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 40);

    // منحنى ناعم في الآخر
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 20,
      size.width,
      size.height - 40,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
