import 'package:flutter/material.dart';

import '../utils/constant.dart';
void snackBarMessage(
    BuildContext context, {
      required String message,
      bool isError = true,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 0),
      duration: const Duration(seconds: 3),
      backgroundColor: isError
          ? const Color(0xFFe57373)
          : kSecondaryColor,
      content: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Transform.scale(
              scale: 0.9 + (0.1 * value),
              child: child,
            ),
          );
        },
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
  );
}
void snackBarMessageOverlay(
    BuildContext context, {
      required String message,
      bool isError = true,
    }) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _AnimatedOverlaySnackBar(
      message: message,
      isError: isError,
      onDismissed: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}

class _AnimatedOverlaySnackBar extends StatefulWidget {
  const _AnimatedOverlaySnackBar({
    required this.message,
    required this.isError,
    required this.onDismissed,
  });

  final String message;
  final bool isError;
  final VoidCallback onDismissed;

  @override
  State<_AnimatedOverlaySnackBar> createState() =>
      _AnimatedOverlaySnackBarState();
}

class _AnimatedOverlaySnackBarState extends State<_AnimatedOverlaySnackBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 250),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        await _controller.reverse();
        widget.onDismissed();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              color: widget.isError
                  ? const Color(0xFFe57373)
                  : kSecondaryColor,
              child: SafeArea(
                top: false,
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}