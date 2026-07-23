import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';

class PaymentMethodsWithDelivery extends StatelessWidget {
  const PaymentMethodsWithDelivery({
    super.key, required this.isSelected , this.onTap,
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
          color: isSelected ? AppColors.kSecondaryColor : const Color(
            0xffF3F4F6,
          ),
          elevation: 5,
          shadowColor: Colors.black,
          child: Center(
            child: ListTile(
              title: CustomText(
                text: 'Cash on Delivery',
                color: isSelected? 0xFFFFFFFF : AppColors.kIntSecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              leading: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.kPrimaryColor : AppColors.kSecondaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '\$',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
