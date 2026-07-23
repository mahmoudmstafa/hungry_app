import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';

import '../../../../core/app_setup/app_providers.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  static const String id = 'ProductDetails';

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: AppProviders.productDetailsProviders(),
        child: const ProductDetailsViewBody(),
      ),
    );
  }

}
