import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hungry_app/core/utils/app_routes.dart';
import 'package:hungry_app/features/aut_feature/presentation/views/login_view.dart';
import 'package:hungry_app/features/home_feature/presentation/views/home_view.dart';

import '../../../../../core/utils/secure_storage_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'animation_logo_splash_view.dart';
import 'animation_purger_splash_view.dart';
import 'animation_text_fast_fresh_deli_splash_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _startApp();
  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Get.offAllNamed(AppRoutes.rootView);
        }

        if (state is AuthFailure) {
          Get.offAllNamed(AppRoutes.login);
        }
      },
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            AnimationLogoSplashView(),
            const Gap(10),
            const AnimationTextFastFreshDeliSplashView(),
            const Spacer(),
            const AnimationPurgerSplashView(),
          ],
        ),
      ),
    );
  }

  Future<void> navigateToLoginView() async {
    await Future.delayed(
      const Duration(
        milliseconds: 4700,
      ),
      () {
        Get.offNamed(
          AppRoutes.login,
        );
      },
    );
  }

  Future<void> _checkAuth() async {
    final token = await getIt<SecureStorageService>().getToken();

    if (!mounted) return;

    if (token == null) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    context.read<AuthCubit>().autoLogin();
  }

  Future<void> _startApp() async {
    await Future.delayed(
      const Duration(milliseconds: 4700),
    );

    if (!mounted) return;

    await _checkAuth();
  }
}
