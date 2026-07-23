import 'package:flutter/material.dart';

import 'favourite_card.dart';

class FavouritesCardsSlider extends StatefulWidget {
  const FavouritesCardsSlider({super.key, required this.favourites});

  final List favourites;

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
    _setupPageController();
    _setupAnimations();
    _startAnimationAfterDelay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _entranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              itemCount: widget.favourites.length,
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
                    key: ValueKey(widget.favourites[index].id),
                    products: widget.favourites[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _setupPageController() {
    _pageController = PageController(viewportFraction: _viewportFraction);
  }

  void _setupAnimations() {
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: Curves.easeOutCubic,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _startAnimationAfterDelay() {
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) _entranceController.forward();
    });
  }
}