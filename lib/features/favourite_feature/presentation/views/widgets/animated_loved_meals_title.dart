
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';

class AnimatedLovedMealsTitle extends StatefulWidget {
  const AnimatedLovedMealsTitle({super.key});

  @override
  State<AnimatedLovedMealsTitle> createState() =>
      _AnimatedLovedMealsTitleState();
}

class _AnimatedLovedMealsTitleState extends State<AnimatedLovedMealsTitle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimationAfterDelay();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: const CustomText(
            text: '💚🍽️  Your Loved Meals  🍽️💚',
            color: 0xFFFFFFFF,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }


  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _startAnimationAfterDelay() {
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _controller.forward();
    });
  }
}