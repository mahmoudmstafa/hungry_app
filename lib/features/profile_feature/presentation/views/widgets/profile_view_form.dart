import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/payment_with_card_profile_view.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/text_form_fields_profile_view_section.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'buttons_profile_view_section.dart';
import 'custom_divider_profile_view.dart';


class ProfileViewForm extends StatelessWidget {
  const ProfileViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(
            20,
          ),
          CustomText(
            text: ' Profile Form :',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kIntPrimaryColor,
          ),
          Gap(15),
          TextFormFieldsProfileViewSection(),
          CustomDividerProfileView(),
          PaymentWithCardProfileView(),
          Expanded(
            child: SizedBox(
              height: 15,
            ),
          ),
          ButtonsProfileViewSection(),
          Gap(25),
        ],
      ),
    );
  }
}
