import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';


class TextWelcomeBackLoginView extends StatelessWidget {
  const TextWelcomeBackLoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CustomText(
        text: 'Welcome Back , Discover The Fast Food ',
        color: 0xFFFFFFFF,
        fontSize: 13,
      ),
    );
  }
}
