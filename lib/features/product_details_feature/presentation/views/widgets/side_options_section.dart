import 'package:flutter/cupertino.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/side_options_list_view.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_text.dart';

class SideOptionSection extends StatelessWidget {
  const SideOptionSection({
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
            text: 'Side options',
            color: kIntSecondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        SideOptionListView(),
      ],
    );
  }
}

