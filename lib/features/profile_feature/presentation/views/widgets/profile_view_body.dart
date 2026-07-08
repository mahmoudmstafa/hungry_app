import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/func/snacbar_message.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_back_button.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_modal_progress_hud.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/core/widgets/custom_text_form_field.dart';
import 'package:hungry_app/features/aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/payment_with_card_profile_view.dart';
import 'package:hungry_app/core/widgets/profile_photo_widget.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_view_form.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/profile_view_header.dart';
import 'package:hungry_app/features/profile_feature/presentation/views/widgets/text_form_fields_profile_view_section.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/bottom_curve_clipper.dart';
import '../../../../../generated/assets.dart';
import 'buttons_profile_view_section.dart';
import 'custom_divider_profile_view.dart';
import 'custom_text_form_field_profile_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isLoading = false;
  DateTime? _loadingStartTime;
  static const _minimumLoadingDuration = Duration(milliseconds: 800);

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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) async {

              // update name
              if (state is UpdateNameSuccess) {
                setState(() => isLoading = false);
                snackBarMessageOverlay(
                  context,
                  isError: false,
                  message: 'Profile updated successfully !!',
                );
              } else if (state is UpdateNameFailure) {
                log('the error is --> ${state.errMessage}');
                await _hideLoadingWithMinimumDuration();
                snackBarMessageOverlay(
                  context,
                  message:
                      'Ops there was an error !!\n Profile updated failed !! Please try again .',
                );
              }

              // logout
              else if (state is LogoutSuccess) {
                await _hideLoadingWithMinimumDuration();

                snackBarMessageOverlay(
                  isError: false,
                  context,
                  message:
                      'Logged out successfully 🍕😉 !\n See you soon .. GoodBye 👋😋 ',
                );
                Future.delayed(const Duration(seconds: 3), () {
                  Get.offAllNamed(AppRoutes.splash);
                });
              } else if (state is AuthFailure) {
                await _hideLoadingWithMinimumDuration();
                log('the error is --> ${state.errMessage}');
              } else if (state is AuthLoading) {
                setState(() => isLoading = true);
              }
            },
            child: CustomModalProgressHud(
              isLoading: isLoading,
              child: Column(
                children: [
                  // header
                  Expanded(
                    flex: 4,
                    child: ProfileViewHeader(),
                  ),

                  // form
                  Expanded(
                    flex: 7,
                    child: ProfileViewForm(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
