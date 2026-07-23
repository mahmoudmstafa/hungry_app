import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants/app_colors.dart';


// flutter pub add modal_progress_hud_nsn

class CustomModalProgressHud extends StatelessWidget {
  const CustomModalProgressHud({
    super.key,
    required this.child,
    this.isLoading = false,
    this.circleColor,
  });

  final bool isLoading;

  final Widget child;

  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.transparent,
      blur: 2,
      progressIndicator: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          color: circleColor ?? AppColors.kSecondaryColor,
          strokeWidth: 4,
        ),
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
