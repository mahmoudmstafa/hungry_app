import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

class ActiveAndInActiveButtonMenu extends StatelessWidget {
  const ActiveAndInActiveButtonMenu({
    super.key,
    required this.isActive, required this.text,
  });

  final bool isActive;

  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text ,
      textColor: isActive ? Colors.white : Color(0xff6A6A6A),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      backgroundColor: isActive ? kPrimaryColor : Color(0xffF3F4F6),
    );
  }
}

