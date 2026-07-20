import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';

class ReOrderIcon extends StatelessWidget {
  const ReOrderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 24),
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '♻️',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
