import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home_feature/domain/entities/product_entity.dart';

import '../../../../../core/app_setup/app_routes.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../home_feature/presentation/views/widgets/rating_widget.dart';
import '../../manager/cubits/favorite_cubit/favorite_cubit.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({super.key, required this.products});

  final ProductEntity products;

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _removeController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  bool _isRemoving = false;

  @override
  @override
  void initState() {
    super.initState();
    _setupRemoveAnimation();
  }

  @override
  void dispose() {
    _removeController.dispose();
    super.dispose();
  }

  Future<void> _handleFavouriteToggle(bool isCurrentlyFavourite) async {
    if (isCurrentlyFavourite) {
      if (_isRemoving) return;
      setState(() => _isRemoving = true);

      await _removeController.forward();

      if (mounted) {
        context.read<FavoriteCubit>().toggleFavourite(widget.products);
      }
    } else {
      context.read<FavoriteCubit>().toggleFavourite(widget.products);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _removeController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            AppRoutes.productDetails,
            arguments: widget.products,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedNetworkImage(
                height: 150,
                width: double.infinity,
                colorCircleIndicator: AppColors.kSecondaryColor,
                imageUrl: widget.products.productImage,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: widget.products.title,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: 0xff3C2F2F,
                    ),
                    CustomText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: widget.products.desc,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: 0xff3C2F2F,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CustomText(
                        text: '\$ ${widget.products.price.round()}',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: 0xFFFFFFFF,
                      ),
                    ),
                    BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        final isFavourite = context
                            .read<FavoriteCubit>()
                            .isFavourite(widget.products.id);
                        return RatingWidget(
                          isFavourite: isFavourite,
                          onPressedFavouriteButton: () {
                            _handleFavouriteToggle(isFavourite);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _setupRemoveAnimation() {
    _removeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.65).animate(
      CurvedAnimation(parent: _removeController, curve: Curves.easeInBack),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _removeController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    );
  }

}
