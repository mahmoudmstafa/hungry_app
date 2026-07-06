import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/widgets/custom_modal_progress_hud.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_dont_have_an_account.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_fields_login_view_section.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/text_get_started_login_view.dart';

import '../../../../../core/func/snacbar_message.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_button.dart';

class LoginFormSectionBlocListener extends StatefulWidget {
  const LoginFormSectionBlocListener({
    super.key,
  });

  @override
  State<LoginFormSectionBlocListener> createState() =>
      _LoginFormSectionBlocListenerState();
}

class _LoginFormSectionBlocListenerState
    extends State<LoginFormSectionBlocListener> {
  final globalKey = GlobalKey<FormState>();
  String? email, password;

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
            message: 'Welcome back ${state.user.name} 🎉\n  We missed you! 😋🍔',
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
        circleColor: kSecondaryColor,
        isLoading: isLoading,
        child: Form(
          key: globalKey,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.symmetric(horizontal: kPadding),
            color: Colors.white,
            child: Column(
              children: [
                TextGetStartedLoginView(),
                TextFieldsLoginViewSection(
                  onEmailSaved: (data) {
                    email = data;
                  },
                  onPasswordSaved: (data) {
                    password = data;
                  },
                ),
                CustomButton(
                  onTap: () {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      BlocProvider.of<AuthCubit>(context).login(
                        email: email!,
                        password: password!,
                      );
                    }
                    FocusScope.of(context).unfocus();
                  },
                  text: 'Login',
                  textColor: Colors.white,
                  textFontSize: 21,
                  height: 55,
                  backgroundColor: kPrimaryColor,
                ),
                Gap(10),
                TextDontHaveAnAccount(),
                Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

