import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/widgets/sign_form_section.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/app_setup/app_snackbar.dart';

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


  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          authSignUpSuccess(context);
        } else if (state is AuthFailure) {
          authSignUpFailure(context, state);
        } else {
          setState(() => isLoading = true);
        }
      },
      child: SignUpFormSection(
        onSavedEmail: (value) => email = value,
        onSavedName: (value) => name = value,
        onSavedPassword: (value) => password = value,
        isLoading: isLoading,
      ),
    );
  }

  void authSignUpFailure(BuildContext context, AuthFailure state) {
    setState(() => isLoading = false);
    AppSnackBar.show(
      context,
      message: state.errMessage,
    );
  }

  void authSignUpSuccess(BuildContext context) {
    setState(() => isLoading = false);
    AppSnackBar.show(
      context,
      isError: false,
      message: 'Welcome $name 🎉\n Your account is ready! 🍔',
    );
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.rootView);
    });
  }
}

