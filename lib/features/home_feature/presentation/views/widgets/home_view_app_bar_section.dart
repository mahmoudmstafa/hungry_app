import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../../../../../core/widgets/custom_text.dart';
import 'app_bar_home_view.dart';


class HomeViewAppBarSection extends StatelessWidget {
  const HomeViewAppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(40),
        AppBarHomeView(),
        CustomText(
          text: 'Hello Mahmoud Mostafa',
          fontSize: 18,
        ),
      ],
    );
  }
}
