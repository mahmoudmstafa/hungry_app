


import 'package:flutter/cupertino.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/toppings_list_view_bloc_builder.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spaces.dart';
import '../../../../../core/widgets/custom_text.dart';
class ToppingsSection extends StatelessWidget {
  const ToppingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpaces.kPadding,
          ),
          child: CustomText(
            text: 'Toppings',
            color: AppColors.kIntSecondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        ToppingsListViewBlocBuilder(),
      ],
    );
  }
}
