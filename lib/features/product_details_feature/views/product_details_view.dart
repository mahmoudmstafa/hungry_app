import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/widgets/custom_text.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/product_details_text.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/product_details_view_body.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/slider_widget.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/spicy_section.dart';

import '../../../core/utils/constant.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../../../generated/assets.dart';


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


