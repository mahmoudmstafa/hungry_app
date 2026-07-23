

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';

class EmptyOrdersWidget extends StatefulWidget {
  const EmptyOrdersWidget({super.key});

  @override
  State<EmptyOrdersWidget> createState() => _EmptyOrdersWidgetState();
}

class _EmptyOrdersWidgetState extends State<EmptyOrdersWidget>
    with TickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  late final AnimationController _floatController;
  late final Animation<double> _floatAnimation;

  @override
  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }
  @override
  void dispose() {
    _entranceController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _floatAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _floatAnimation.value),
                    child: child,
                  );
                },
                child: const Icon(
                  Icons.receipt_long_rounded,
                  size: 90,
                  color: AppColors.kSecondaryColor,
                ),
              ),
              const Gap(16),
              const CustomText(
                text: 'No Orders Yet',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: 0xff3C2F2F,
              ),
              const Gap(6),
              const CustomText(
                text: 'Your order history will show up here\nonce you place your first order',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: 0xff9B9B9B,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setupAnimations() {
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _entranceController, curve: Curves.easeOutBack),
    );

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _entranceController.forward();
    });
  }

}