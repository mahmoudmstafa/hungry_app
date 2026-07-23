import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home_feature/presentation/views/widgets/rating_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../favourite_feature/presentation/manager/cubits/favorite_cubit/favorite_cubit.dart';
import '../../../domain/entities/product_entity.dart';


class FoodCardDetails extends StatelessWidget {
  const FoodCardDetails({
    super.key,
    required this.products,
  });

  final ProductEntity products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: products.title.length > 15
                    ? (products.title.substring(0, 15))
                    : products.title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: 0xff3C2F2F,
              ),
              CustomText(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                text: products.desc.length > 20
                    ? products.desc.substring(0, 20)
                    : products.desc,
                fontSize: 16,
                color: 0xff3C2F2F,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: AppColors.kSecondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomText(
                text: '\$${products.price.round().toString()}',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: 0xFFFFFFFF ,
              ),
            ),
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                return RatingWidget(
                  isFavourite: context.read<FavoriteCubit>().isFavourite(
                    products.id,
                  ),
                  onPressedFavouriteButton: () {
                    context.read<FavoriteCubit>().toggleFavourite(
                      products,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
