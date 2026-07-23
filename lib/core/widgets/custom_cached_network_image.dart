
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

import 'custom_animation_loading_widget.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.placeHolderImage,
    required this.imageUrl,
    this.errorWidget,
    this.colorCircleIndicator,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.boxShadow,
    this.borderRadiusLoadingImage,
  });

  final BorderRadius? borderRadiusLoadingImage;
  final String? placeHolderImage;
  final Widget? errorWidget;
  final String imageUrl;
  final Color? colorCircleIndicator;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeHolderImage == null
          ? CustomAnimationLoadingWidget(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      borderRadiusLoadingImage ??
                      const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            )
          : Image.network(placeHolderImage!),
      imageUrl: imageUrl,
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Icon(
            Icons.fastfood,
            size: 32,
            color: AppColors.kSecondaryColor,
          ),
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: boxShadow,
          ),
          child: borderRadius == null
              ? Image(
                  image: imageProvider,
                  fit: fit,
                  width: width,
                  height: height,
                )
              : ClipRRect(
                  borderRadius: borderRadius!,
                  child: Image(
                    image: imageProvider,
                    fit: fit,
                    width: width,
                    height: height,
                  ),
                ),
        );
      },
    );
  }
}
