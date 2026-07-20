import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/favorite_cubit/favorite_cubit.dart';
import 'favourite_card.dart';

class FavouritesCardsSlider extends StatefulWidget {
  const FavouritesCardsSlider({super.key});

  @override
  State<FavouritesCardsSlider> createState() => FavouritesCardsSliderState();
}

class FavouritesCardsSliderState extends State<FavouritesCardsSlider>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _entranceController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  static const double _viewportFraction = 0.62;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _viewportFraction);

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );

    _scaleAnimation =
        Tween<double>(
          begin: 0.9,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _entranceController,
            curve: Curves.easeOutCubic,
          ),
        );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.15),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _entranceController,
            curve: Curves.easeOutCubic,
          ),
        );

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) _entranceController.forward();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _entranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final favourites = context.read<FavoriteCubit>().favourites;
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SizedBox(
                height: 270,
                child: PageView.builder(
                  clipBehavior: Clip.none,
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double scale = 1.0;
                        double opacity = 1.0;

                        if (_pageController.position.haveDimensions) {
                          final page = _pageController.page ?? 0;
                          final distance = (page - index).abs();
                          scale = (1 - (distance * 0.22)).clamp(0.78, 1.0);
                          opacity = (1 - (distance * 0.45)).clamp(0.55, 1.0);
                        }

                        return Center(
                          child: Opacity(
                            opacity: opacity,
                            child: Transform.scale(
                              scale: scale,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: FavouriteCard(
                        key: ValueKey(favourites[index].id),
                        products: favourites[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
