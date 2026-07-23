import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class PaymentWithCardProfileView extends StatelessWidget {
  const PaymentWithCardProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none,
        ),
        color: AppColors.kSecondaryColor,
        elevation: 5,
        shadowColor: Colors.black,
        child: Center(
          child: ListTile(
            title: const CustomText(
              text: 'Debit card',
              color: 0xffffffff,
              fontSize: 14,
              fontWeight: FontWeight.w500,

            ),
            subtitle: const CustomText(
              text: '3566 **** **** 0505',
              color: 0xffffffff,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            leading: Image.asset(
              height: 65,
              width: 65,
              Assets.assets.images.visa.path,
            ),
            trailing: const Icon(
              Icons.radio_button_checked,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
