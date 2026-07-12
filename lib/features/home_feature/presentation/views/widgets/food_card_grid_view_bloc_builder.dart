import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/custom_animation_loading_widget.dart';
import '../../../../../core/widgets/custom_circle_loading.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/loading_food_card_grid_view_widget.dart';
import '../../manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'food_card.dart';
import 'food_card_grid_view.dart';

class FoodCardGridViewBlocBuilder extends StatefulWidget {
  const FoodCardGridViewBlocBuilder({super.key});

  @override
  State<FoodCardGridViewBlocBuilder> createState() =>
      _FoodCardGridViewBlocBuilderState();
}

class _FoodCardGridViewBlocBuilderState
    extends State<FoodCardGridViewBlocBuilder> {
  List<ProductEntity> products = [];

  @override
  void initState() {
    super.initState();

    final cubit = context.read<GetProductCubit>();

    if (cubit.products.isEmpty) {
      cubit.getProducts();
    }
  }

  @override
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final cubit = context.read<GetProductCubit>();

    for (final product in cubit.products) {
      if (!mounted) {
        return;
      }

      precacheImage(
        CachedNetworkImageProvider(product.productImage),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        // الحالة الأولى: لسه بيحمل البيانات لأول مرة
        if (state is GetProductsLoading || state is GetProductInitial) {
          return LoadingFoodCardGridViewWidget();
        }

        // الحالة الثانية: حصل خطأ في تحميل البيانات
        if (state is GetProductsFailure) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: CustomErrorMessage(
              errMessage: state.errMessage,
            ),
          );
        }

        // هنا بنجهز قائمة المنتجات اللي هتتعرض
        // بنبدأها فاضية، وبعدين نحطلها القيمة المناسبة حسب نوع الحالة

        if (state is GetProductsSuccess) {
          products = state.products;
        } else if (state is GetProductsLoadingMore) {
          products = state.products;
        } else if (state is GetProductsPaginationError) {
          products = state.products;
        }

        // بنجهز متغيرات بسيطة تساعدنا نعرف إيه اللي المفروض يظهر تحت الشبكة
        bool isLoadingMoreProducts = state is GetProductsLoadingMore;
        bool didPaginationFail = state is GetProductsPaginationError;

        return Column(
          children: [
            // لو بيحمل صفحة إضافية، نعرض دائرة تحميل صغيرة تحت
            if (isLoadingMoreProducts)
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: CustomCircleLoading(
                    color: kSecondaryColor,
                    height: 35,
                    width: 35,
                  ),
                ),
              ),

            // لو فشل تحميل الصفحة الإضافية، نعرض زرار لإعادة المحاولة
            if (didPaginationFail)
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    context.read<GetProductCubit>().loadNextPage();
                  },
                  child: const Text('Failed to load more. Tap to retry'),
                ),
              ),
            FoodCardGridView(products: products),
          ],
        );
      },
    );
  }
}
