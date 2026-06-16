import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/checkout_feature/presentation/views/widgets/price_break_down_widget.dart';

class PriceBreakdownWidgetListView extends StatelessWidget {
  const PriceBreakdownWidgetListView({super.key});

  static final List<String> listOfPriceBreakdown = const [
    'Order',
    'Taxes',
    'Delivery fees',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        return PriceBreakdownWidget(
          text: listOfPriceBreakdown[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Gap(10);
      },
    );
  }
}
