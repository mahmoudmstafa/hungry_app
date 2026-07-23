import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/core/widgets/profile_photo_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/bottom_curve_clipper.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';



class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        color: AppColors.kPrimaryColor,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomBackButton(
                settings: false,
                colorOfBackIcon: AppColors.kPrimaryColor,
              ),
            ),
            const Gap(15),
            ProfilePhotoWidget(
              photo: context.watch<AuthCubit>().user.photo,
              onTap: (){
                context.read<AuthCubit>().pickProfileImage();
              },
              width: 120,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
