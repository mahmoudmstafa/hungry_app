import 'package:flutter/material.dart';

import '../widgets/success_widget.dart';


void showAnimatedReOrderDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const Material(
        type: MaterialType.transparency,
        child: PopScope(
          canPop: false,
          child: SuccessWidget(),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeIn,
      );
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
        ),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.75, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}


