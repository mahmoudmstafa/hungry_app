import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/favorite_cubit/favorite_cubit.dart';
import 'empty_favourites_widget.dart';
import 'favourites_cards_slider.dart';


class FavouritesCardsSliderBlocBuilder extends StatelessWidget {
  const FavouritesCardsSliderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final favourites = context.read<FavoriteCubit>().favourites;

        if (favourites.isEmpty) {
          return const EmptyFavouritesWidget();
        }
        return FavouritesCardsSlider();
      },
    );
  }
}
