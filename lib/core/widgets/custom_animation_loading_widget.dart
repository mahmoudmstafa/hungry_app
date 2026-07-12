import 'package:flutter/material.dart';

class CustomAnimationLoadingWidget extends StatefulWidget {
  const CustomAnimationLoadingWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CustomAnimationLoadingWidget> createState() =>
      _CustomAnimationLoadingWidgetState();
}

class _CustomAnimationLoadingWidgetState
    extends State<CustomAnimationLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationBody();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }

  void animationBody() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    animation = Tween<double>(
      begin: .2,
      end: .8,
    ).animate(animationController);
    animationController.repeat(
      reverse: true,
    );
    animationController.addListener(
      () {
        if (mounted) {
          setState(
            () {},
          );
        }
      },
    );
  }
}
