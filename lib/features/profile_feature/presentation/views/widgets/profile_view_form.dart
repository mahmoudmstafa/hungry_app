
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/payment_with_card_profile_view.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/text_form_fields_profile_view_section.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'buttons_profile_view_section.dart';
import 'custom_divider_profile_view.dart';

class ProfileViewForm extends StatefulWidget {
  const ProfileViewForm({
    super.key,
  });

  @override
  State<ProfileViewForm> createState() => _ProfileViewFormState();
}

class _ProfileViewFormState extends State<ProfileViewForm> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpaces.kPadding,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(
            20,
          ),
          const CustomText(
            text: ' Profile Form :',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.kIntPrimaryColor,
          ),
          const Gap(15),
          TextFormFieldsProfileViewSection(
            onChangedName: (data) {
              name = data;
            },
          ),
          const CustomDividerProfileView(),
          const PaymentWithCardProfileView(),
          const Expanded(
            child: SizedBox(
              height: 15,
            ),
          ),
          ButtonsProfileViewSection(
            onTapButtonEditProfile: () {
              BlocProvider.of<AuthCubit>(context).updateNameAndPhoto(
                name: name,
              );
            },
          ),
          const Gap(25),
        ],
      ),
    );
  }
}
