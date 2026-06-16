import 'package:flutter/material.dart';
import 'package:hungry_app/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';


class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const String id = 'ProductDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductDetailsViewBody() ,
    );
  }
}


