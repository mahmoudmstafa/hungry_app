part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavouriteLoaded extends FavoriteState {
  final List<ProductEntity> favourites;

  FavouriteLoaded(this.favourites);
}