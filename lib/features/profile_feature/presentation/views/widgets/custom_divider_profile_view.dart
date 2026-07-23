import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

class CustomDividerProfileView extends StatelessWidget {
  const CustomDividerProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 40,
        bottom: 10,
      ),
      child: Divider(
        color: Color(
          AppColors.kIntPrimaryColor,
        ),
        endIndent: 20,
        indent: 20,
        thickness: .5,
      ),
    );
  }
}
