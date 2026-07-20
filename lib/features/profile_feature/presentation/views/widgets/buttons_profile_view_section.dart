import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../generated/assets.dart';
import '../../../../aut_feature/presentation/manager/cubits/auth_cubit.dart';
import 'bouncy_tap.dart';
import 'custom_button_profile_view.dart';

class ButtonsProfileViewSection extends StatefulWidget {
  const ButtonsProfileViewSection({super.key, this.onTapButtonEditProfile});

  final void Function()? onTapButtonEditProfile;

  @override
  State<ButtonsProfileViewSection> createState() =>
      _ButtonsProfileViewSectionState();
}

class _ButtonsProfileViewSectionState extends State<ButtonsProfileViewSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _entranceController, curve: Curves.easeOutCubic),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _entranceController.forward();
    });
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Row(
          children: [
            Expanded(
              child: BouncyTap(
                child: CustomButtonProfileView(
                  onTap: widget.onTapButtonEditProfile,
                  outBorderColor: true,
                  text: 'Edit Name',
                  textColor: kPrimaryColor,
                  backgroundColor: Colors.white,
                  image: Assets.assets.images.edit.path,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: BouncyTap(
                child: CustomButtonProfileView(
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).logout();
                  },
                  text: 'Log out',
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  image: Assets.assets.images.signOut.path,
                  outBorderColor: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}