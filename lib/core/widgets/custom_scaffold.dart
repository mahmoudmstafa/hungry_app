import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child, this.backgroundColor, this.resizeToAvoidBottomInset});

  final Widget child;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor ?? Colors.white,
        body: child,
      ),
    );
  }
}
