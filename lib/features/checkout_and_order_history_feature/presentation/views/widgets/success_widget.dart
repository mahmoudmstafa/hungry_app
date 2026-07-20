import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/text_success_view.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/true_icon_success_view.dart';
import '../../../../../generated/assets.dart';
import 'custom_button_success_view.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * .4,
        margin: EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Column(
          children: [
            TrueIconSuccessView(),
            TextSuccessView(),
            Spacer(),
            CustomButtonSuccessWidget(),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
