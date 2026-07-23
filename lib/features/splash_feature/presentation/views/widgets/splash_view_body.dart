import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/network/secure_storage_service.dart';
import '../../../../../core/app_setup/app_service_locator.dart';
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
      child: const Center(
        child: Column(
          children: [
            Spacer(),
            AnimationLogoSplashView(),
            Gap(10),
            AnimationTextFastFreshDeliSplashView(),
            Spacer(),
            AnimationPurgerSplashView(),
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


  Future<void> _startApp() async {
    await Future.delayed(
      const Duration(milliseconds: 4700),
    );

    if (!mounted) return;

    await _checkAuth();
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

}
