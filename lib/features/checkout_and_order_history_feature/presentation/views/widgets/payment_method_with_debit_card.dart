import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../generated/assets.dart';

class PaymentMethodWithDebitCard extends StatelessWidget {
  const PaymentMethodWithDebitCard({
    super.key,
    required this.isSelected , this.onTap,
  });

  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide.none,
          ),
          color: isSelected
              ? AppColors.kSecondaryColor
              : const Color(
                  0xffF3F4F6,
                ),
          elevation: 5,
          shadowColor: Colors.black,
          child: Center(
            child: ListTile(
              title: CustomText(
                text: 'Debit card',
                color: isSelected ? 0xFFFFFFFF : AppColors.kIntSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              subtitle: CustomText(
                text: '3566 **** **** 0505',
                color: isSelected ? 0xFFFFFFFF : 0xff808080,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              leading: Image.asset(
                height: 65,
                width: 65,
                Assets.assets.images.visa.path,
              ),
              trailing: Icon(
                isSelected ? Icons.radio_button_checked :
              Icons.radio_button_unchecked,
              color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
