import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import 'curved_bottom_clipper.dart';
import 'favourites_view_body.dart';

class CurvedHeaderImage extends StatefulWidget {
  const CurvedHeaderImage({super.key});

  @override
  State<CurvedHeaderImage> createState() => _CurvedHeaderImageState();
}

class _CurvedHeaderImageState extends State<CurvedHeaderImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.08,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.05),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
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
          child: ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              height: MediaQuery.of(context).size.width * 1.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.assets.images.bac.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}