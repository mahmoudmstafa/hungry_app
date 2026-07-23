import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/favourite_feature/presentation/views/widgets/favourites_view_body.dart';

import '../../../../core/constants/app_colors.dart';
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
    return const Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      body: FavouritesViewBody(),
    );
  }
}
