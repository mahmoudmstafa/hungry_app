import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/checkout_and_order_history_feature/presentation/views/widgets/checkout_view_body.dart';
import 'package:nested/nested.dart';

import '../../../../core/utils/service_locator.dart';
import '../manger/cubits/checkout_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const String id = 'CheckoutView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CheckoutViewBody(),
    );
  }

}
