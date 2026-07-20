import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';

import '../../generated/assets.dart';
import '../utils/app_routes.dart';

class CustomAddOrPayWidget extends StatelessWidget {
  const CustomAddOrPayWidget({
    super.key,
    required this.textButton,
    this.text,
    this.textColor,
    this.textWeight,
    this.price,
    this.fontSize,
    this.padding,
    this.onTap,
  });

  final String textButton;
  final String? text;
  final int? textColor;
  final FontWeight? textWeight;
  final double? fontSize;

  final int? price;
  final EdgeInsets? padding;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, top: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.7,
                            end: 1.0,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: CustomText(
                      key: ValueKey<int?>(price),
                      fontFamily: 'ReemKufiInk',
                      text: '\$ $price',
                      color: 0xFFFFFFFF,
                      fontWeight: textWeight,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _BouncyButton(
                child: CustomButton(
                  borderRadius: 20,
                  onTap: onTap,
                  text: textButton,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget بيدي تأثير "نطة" لطيف (Bounce/Spring) لأي child عند الضغط،
/// من غير ما يتعارض مع الـ Gesture الأصلي بتاعه (زي onTap في CustomButton).
class _BouncyButton extends StatefulWidget {
  const _BouncyButton({required this.child});

  final Widget child;

  @override
  State<_BouncyButton> createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<_BouncyButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    // Curve فيها "نطة" خفيفة (overshoot بسيط) وقت الرجوع لحجمها الطبيعي
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.88)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.88, end: 1.04)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.04, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent _) {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}