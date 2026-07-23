import 'package:flutter/material.dart';




class AnimatedPressWrapper extends StatefulWidget {
  const AnimatedPressWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AnimatedPressWrapper> createState() => _AnimatedPressWrapperState();
}

class _AnimatedPressWrapperState extends State<AnimatedPressWrapper> {
  double _scale = 1.0;

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _scale = 0.70);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _scale = 1.0);
  }

  void _onPointerCancel(PointerCancelEvent event) {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
