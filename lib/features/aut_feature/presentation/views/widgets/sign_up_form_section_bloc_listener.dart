import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/func/snacbar_message.dart';
import 'package:hungry_app/core/widgets/custom_modal_progress_hud.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_already_hava_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_sign_up_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

class SignUpFormSectionBlocListener extends StatefulWidget {
  const SignUpFormSectionBlocListener({super.key});

  @override
  State<SignUpFormSectionBlocListener> createState() =>
      _SignUpFormSectionBlocListenerState();
}

class _SignUpFormSectionBlocListenerState
    extends State<SignUpFormSectionBlocListener> {
  String? name;

  String? password;

  String? email;

  final globalKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          setState(() => isLoading = false);
          snackBarMessage(
            context,
            isError: false,
            message: 'Welcome $name 🎉\n Your account is ready! 🍔',
          );
          Future.delayed(const Duration(seconds: 3), () {
            Get.offNamed(AppRoutes.rootView);
          });
        } else if (state is AuthFailure) {
          setState(() => isLoading = false);
          snackBarMessage(
            context,
            message: state.errMessage,
          );
        } else if (state is AuthLoading) {
          setState(() => isLoading = true)  ;
        }
      },
      child: CustomModalProgressHud(
        isLoading: isLoading,
        child: Form(
          key: globalKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            color: kPrimaryColor,
            child: Column(
              children: [
                Gap(20),
                TextGetStartedLoginView(
                  isSignUp: true,
                ),
                TextFieldSignUpViewSection(
                  onSavedEmail: (data) {
                    email = data;
                  },
                  onSavedName: (data) {
                    name = data;
                  },
                  onSavedPassword: (data) {
                    password = data;
                  },
                ),
                CustomButton(
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
                  textColor: kPrimaryColor,
                  textFontSize: 20,
                  height: 55,
                  backgroundColor: Colors.white,
                ),
                Gap(10),
                TextAlreadyHavaAnAccount(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
