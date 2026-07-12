import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';
import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'custom_button_profile_view.dart';

class ButtonsProfileViewSection extends StatefulWidget {
  const ButtonsProfileViewSection({super.key, this.onTapButtonEditProfile});

  final void Function()? onTapButtonEditProfile ;
  @override
  State<ButtonsProfileViewSection> createState() =>
      _ButtonsProfileViewSectionState();
}

class _ButtonsProfileViewSectionState extends State<ButtonsProfileViewSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonProfileView(
            onTap: widget.onTapButtonEditProfile,
            outBorderColor: true,
            text: 'Edit Name',
            textColor: kPrimaryColor,
            backgroundColor: Colors.white,
            image: Assets.assets.images.edit.path,
          ),
        ),
        Gap(10),
        Expanded(
          child: CustomButtonProfileView(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).logout();
            },
            text: 'Log out',
            textColor: Colors.white,
            backgroundColor: kPrimaryColor,
            image: Assets.assets.images.signOut.path, outBorderColor: false,
          ),
        ),
      ],
    );
  }
}
