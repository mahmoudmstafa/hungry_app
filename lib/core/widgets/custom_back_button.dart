import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../utils/constant.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.settings = false,
    this.colorOfBackIcon,
  });

  final bool settings;

  final Color? colorOfBackIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(kTopSpace),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _BouncyTap(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                Assets.assets.images.back.path,
                color: colorOfBackIcon,
              ),
            ),
            settings
                ? SvgPicture.asset(
              Assets.assets.images.settings.path,
            )
                : const SizedBox(),
          ],
        ),
        const Gap(20),
      ],
    );
  }
}

/// Widget بيدي تأثير "نطة" لطيف (Bounce/Spring) لأي child عند الضغط،
/// مناسب للعناصر الصغيرة زي الأيقونات (Icons/SVG).
class _BouncyTap extends StatefulWidget {
  const _BouncyTap({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<_BouncyTap> createState() => _BouncyTapState();
}

class _BouncyTapState extends State<_BouncyTap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.8)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.8, end: 1.08)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.08, end: 1.0)
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward(from: 0);
        widget.onTap?.call();
      },
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