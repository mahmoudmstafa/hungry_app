import 'package:flutter/material.dart';
import 'package:hungry_app/core/widgets/custom_scaffold.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/sign_up_view_body.dart';

import '../../../../core/constants/app_colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String id = 'SignUpView';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundColor: AppColors.kPrimaryColor,
      child: SignUpViewBody(),
    );
  }
}