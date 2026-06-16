import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/custom_button_success_view.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/success_view_body.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/text_success_view.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/true_icon_success_view.dart';

import '../../../../generated/assets.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffBCBBBB,
      ),
      body: SuccessViewBody(
        child: Column(
          children: [
            TrueIconSuccessView(),
            TextSuccessView(),
            Spacer(),
            CustomButtonSuccessView(),
            Gap(20),
          ],
        ),
      ),
    );
  }
}




