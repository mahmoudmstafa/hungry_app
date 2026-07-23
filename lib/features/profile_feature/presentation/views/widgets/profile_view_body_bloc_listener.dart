
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_view_body.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/app_setup/app_snackbar.dart';

class ProfileViewBodyBlocListener extends StatefulWidget {
  const ProfileViewBodyBlocListener({super.key});

  @override
  State<ProfileViewBodyBlocListener> createState() =>
      _ProfileViewBodyBlocListenerState();
}

class _ProfileViewBodyBlocListenerState
    extends State<ProfileViewBodyBlocListener> {
  bool isLoading = false;
  DateTime? _loadingStartTime;
  static const _minimumLoadingDuration = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) async {
              // update name
              if (state is UpdateNameSuccess) {
                updateNameSuccess(context);
              } else if (state is UpdateNameFailure) {
                await updateNameFailure(context);
              }
              // logout
              else if (state is LogoutSuccess) {
                await logoutSuccess(context);
              } else if (state is AuthFailure) {
                await _hideLoadingWithMinimumDuration();
              } else if (state is AuthLoading) {
                setState(() => isLoading = true);
              }
            },

            child: ProfileViewBody(
              isLoading: isLoading,
            ),
          ),
        ),
      ],
    );
  }

  void updateNameSuccess(BuildContext context) {
    setState(() => isLoading = false);
    AppSnackBar.showOverlay(
      context,
      isError: false,
      message: 'Profile updated successfully !!',
    );
  }

  Future<void> updateNameFailure(BuildContext context) async {
    await _hideLoadingWithMinimumDuration();
    AppSnackBar.showOverlay(
      context,
      message:
          'Ops there was an error !!\n Profile updated failed !! Please try again .',
    );
  }

  Future<void> logoutSuccess(BuildContext context) async {
    await _hideLoadingWithMinimumDuration();

    AppSnackBar.showOverlay(
      isError: false,
      context,
      message: 'Logged out successfully 🍕😉 !\n See you soon .. GoodBye 👋😋 ',
    );
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.splash);
    });
  }

  Future<void> _hideLoadingWithMinimumDuration() async {
    if (_loadingStartTime != null) {
      final elapsed = DateTime.now().difference(_loadingStartTime!);
      final remaining = _minimumLoadingDuration - elapsed;

      if (remaining > Duration.zero) {
        await Future.delayed(remaining);
      }
    }
    if (mounted) {
      setState(() => isLoading = false);
    }
  }
}

