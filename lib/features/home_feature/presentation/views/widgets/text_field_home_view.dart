import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/assets.dart';

class TextFieldHomeView extends StatelessWidget {
  const TextFieldHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CustomTextFormField(
        cursorColor: kSecondaryColor,
        textStyle: TextStyle(
          color: kSecondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        focusedBorderColor: kPrimaryColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 14.0,
            bottom: 13,
            left: 25,
            right: 28,
          ),
          child: SvgPicture.asset(
            Assets.assets.images.search.path,
            width: 24,
          ),
        ),
        hintText: "Search",
        hintColor: kSecondaryColor,
        enabledBorderColor: Colors.white,
      ),
    );
  }
}
