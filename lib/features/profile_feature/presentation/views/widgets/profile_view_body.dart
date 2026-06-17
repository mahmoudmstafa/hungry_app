import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_back_button.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/payment_with_card_profile_view.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_photo_widget.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/text_form_fields_profile_view_section.dart';

import '../../../../../generated/assets.dart';
import 'buttons_profile_view_section.dart';
import 'custom_divider_profile_view.dart';
import 'custom_text_form_field_profile_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomBackButton(
                  settings: true,
                  colorOfBackIcon: Colors.white,
                ),
                ProfilePhotoWidget(),
                TextFormFieldsProfileViewSection(),
                CustomDividerProfileView(),
                PaymentWithCardProfileView(),
                Gap(25),
                ButtonsProfileViewSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

