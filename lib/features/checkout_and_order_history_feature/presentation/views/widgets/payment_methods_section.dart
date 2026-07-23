import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/payment_method_text.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/payment_method_with_debit_card.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/payment_method_with_delivery.dart';

import 'button_save_card_details_and_list_tile.dart';

enum PaymentMethod {
  delivery,
  debitCard,
}

class PaymentMethodsSection extends StatefulWidget {
  const PaymentMethodsSection({
    super.key,
  });

  @override
  State<PaymentMethodsSection> createState() => _PaymentMethodsSectionState();
}

class _PaymentMethodsSectionState extends State<PaymentMethodsSection> {
  PaymentMethod selectedMethod = PaymentMethod.delivery;

  bool saveCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PaymentMethodText(),
        const Gap(10),
        PaymentMethodsWithDelivery(
          onTap: () {
            setState(() {
              selectedMethod = PaymentMethod.delivery;
            });
          },
          isSelected: selectedMethod == PaymentMethod.delivery,
        ),
        const Gap(10),
        PaymentMethodWithDebitCard(
          onTap: () {
            setState(() {
              selectedMethod = PaymentMethod.debitCard;
            });
          },
          isSelected: selectedMethod == PaymentMethod.debitCard,
        ),
        const ButtonSaveCardDetailsAndListTile(),
      ],
    );
  }
}
