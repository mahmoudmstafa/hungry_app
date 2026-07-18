


import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';


class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key, this.onPressedFavouriteButton, required this.isFavourite });

  final void Function()? onPressedFavouriteButton;

  final bool isFavourite ;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressedFavouriteButton,
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: isFavourite ? kPrimaryColor : kSecondaryColor,
      ),
    );
  }
}
