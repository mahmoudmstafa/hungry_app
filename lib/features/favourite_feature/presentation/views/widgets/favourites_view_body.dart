import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

import 'animated_loved_meals_title.dart';
import 'curved_header_image.dart';
import 'empty_favourites_widget.dart';
import 'favourites_cards_slider.dart';
import 'favourites_cards_slider_bloc_builder.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  static const String id = 'FavouritesViewBody';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CurvedHeaderImage(),
              const Gap(5),
              AnimatedLovedMealsTitle(),
              const Gap(20),
              const FavouritesCardsSliderBlocBuilder(),
            ],
          ),
        ),
      ],
    );
  }
}

