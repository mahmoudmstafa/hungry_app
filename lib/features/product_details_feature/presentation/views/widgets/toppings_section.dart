


import 'package:flutter/cupertino.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/toppings_list_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';
class ToppingsSection extends StatelessWidget {
  const ToppingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding,
          ),
          child: CustomText(
            text: 'Toppings',
            color: kIntSecondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        ToppingsListView(),
      ],
    );
  }
}
