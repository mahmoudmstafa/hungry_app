import 'package:flutter/material.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/save_card_details_check_button.dart';

import '../../../../../core/widgets/custom_text.dart';

class ButtonSaveCardDetailsAndListTile extends StatelessWidget {
  const ButtonSaveCardDetailsAndListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      visualDensity: VisualDensity.compact,
      title: CustomText(
        text: 'Save card details for future payments',
        fontSize: 13,
        color: 0xff808080,
      ),
      leading: SaveCardDetailsCheckButton(),
    );
  }
}
