import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/cubits/auth_cubit.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
    required this.globalKey,
    required this.onLoginPressed,
  });

  final GlobalKey<FormState> globalKey;

  final VoidCallback onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (globalKey.currentState!.validate()) {
          globalKey.currentState!.save();
          onLoginPressed();
        }
        FocusScope.of(context).unfocus();
      },
      text: 'Login',
      textColor: Colors.white,
      textFontSize: 21,
      height: 55,
      backgroundColor: AppColors.kPrimaryColor,
    );
  }
}
