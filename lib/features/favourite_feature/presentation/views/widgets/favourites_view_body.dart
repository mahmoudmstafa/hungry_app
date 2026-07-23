import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import 'animated_loved_meals_title.dart';
import 'curved_header_image.dart';
import 'favourites_cards_slider_bloc_builder.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  static const String id = 'FavouritesViewBody';

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CurvedHeaderImage(),
              Gap(5),
              AnimatedLovedMealsTitle(),
              Gap(15),
              FavouritesCardsSliderBlocBuilder(),
            ],
          ),
        ),
      ],
    );
  }
}

