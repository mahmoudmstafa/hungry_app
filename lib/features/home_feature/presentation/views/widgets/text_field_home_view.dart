import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

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
        focusedBorderColor: kPrimaryColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 13.0,
            bottom: 13,
            left: 25,
            right: 28,
          ),
          child: SvgPicture.asset(
            Assets.assets.images.search.path,
          ),
        ),
        hintText: "Search",
        hintColor: kSecondaryColor,
        enabledBorderColor: Colors.white,
      ),
    );
  }
}
