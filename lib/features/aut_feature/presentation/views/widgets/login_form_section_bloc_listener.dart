import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/app_setup/app_snackbar.dart';
import 'login_form_section.dart';

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
  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          authLoginSuccess(context, state);
        } else if (state is AuthFailure) {
          authLoginFailure(context, state);
        } else if (state is AuthLoading) {
          setState(() => isLoading = true);
        }
      },
      child: LoginFormSection(
        onLoginPressed: () {
          BlocProvider.of<AuthCubit>(context).login(
            email: email!,
            password: password!,
          );
        },
        onEmailSaved: (value) => email = value,
        onPasswordSaved: (value) => password = value,
        isLoading: isLoading,
      ),
    );
  }

  void authLoginFailure(BuildContext context, AuthFailure state) {
    setState(() => isLoading = false);
    AppSnackBar.show(
      context,
      message: state.errMessage,
    );
  }

  void authLoginSuccess(BuildContext context, AuthSuccess state) {
    setState(() => isLoading = false);
    AppSnackBar.show(
      context,
      isError: false,
      message: 'Welcome back ${state.user.name} 🎉\n  We missed you! 😋🍔',
    );
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(
        AppRoutes.rootView,
      );
    });
  }
}
