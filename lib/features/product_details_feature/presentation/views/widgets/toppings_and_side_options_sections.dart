import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/side_options_section.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/toppings_section.dart';



class ToppingsAndSideOptionsSections extends StatelessWidget {
  const ToppingsAndSideOptionsSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(30),
        ToppingsSection(),
        Gap(10),
        SideOptionSection(),
        Gap(10),
      ],
    );
  }
}
