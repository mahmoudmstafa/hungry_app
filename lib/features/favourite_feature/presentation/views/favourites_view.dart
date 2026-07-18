import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry_app/features/favourite_feature/presentation/views/widgets/favourites_view_body.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../home_feature/domain/entities/product_entity.dart';
import '../../../home_feature/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import '../../../home_feature/presentation/views/widgets/food_card.dart';
import '../../../home_feature/presentation/views/widgets/rating_widget.dart';
import '../manager/cubits/favorite_cubit/favorite_cubit.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  static const String id = 'FavouritesView';

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    context.read<FavoriteCubit>().getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: FavouritesViewBody(),
    );
  }
}
