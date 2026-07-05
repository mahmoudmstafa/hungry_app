import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

class CustomDividerProfileView extends StatelessWidget {
  const CustomDividerProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        bottom: 25,
      ),
      child: Divider(
        color: Color(
          kIntPrimaryColor,
        ),
        endIndent: 20,
        indent: 20,
        thickness: .5,
      ),
    );
  }
}
