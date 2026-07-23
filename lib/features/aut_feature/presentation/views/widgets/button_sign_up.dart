import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/cubits/auth_cubit.dart';



class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({
    super.key,
    required this.globalKey,
    required this.name,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> globalKey;
  final String? name;
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (globalKey.currentState!.validate()) {
          globalKey.currentState!.save();
          FocusScope.of(context).unfocus();
          BlocProvider.of<AuthCubit>(
            context,
          ).signUp(
            name: name!,
            email: email!,
            password: password!,
          );
        }
      },
      text: 'Sign Up',
      textColor: AppColors.kPrimaryColor,
      textFontSize: 20,
      height: 55,
      backgroundColor: Colors.white,
    );
  }
}
