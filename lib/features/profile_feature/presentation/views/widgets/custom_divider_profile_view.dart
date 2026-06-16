import 'package:flutter/material.dart';

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
          0xffE8E8E8,
        ),
        endIndent: 20,
        indent: 20,
        thickness: .9,
      ),
    );
  }
}
