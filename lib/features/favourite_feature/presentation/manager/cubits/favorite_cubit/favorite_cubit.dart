import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../../home_feature/domain/entities/product_entity.dart';
import '../../../../domain/use_cases/add_favorite_use_case.dart';
import '../../../../domain/use_cases/get_favorite_use_case.dart';
import '../../../../domain/use_cases/is_favorite_use_case.dart';
import '../../../../domain/use_cases/remove_favorite_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    required this.firebaseAuth,
    required this.addFavouriteUseCase,
    required this.removeFavouriteUseCase,
    required this.getFavouriteUseCase,
    required this.isFavouriteUseCase,
  }) : super(FavoriteInitial());

  final FirebaseAuth firebaseAuth;

  final AddFavouriteUseCase addFavouriteUseCase;
  final RemoveFavouriteUseCase removeFavouriteUseCase;
  final GetFavouriteUseCase getFavouriteUseCase;
  final IsFavouriteUseCase isFavouriteUseCase;

  String get userId => firebaseAuth.currentUser!.uid;

  List<ProductEntity> favourites = [];

  // remove favourite
  Future<void> removeFavourite(ProductEntity product) async {
    await removeFavouriteUseCase(
      product.id,
      userId,
    );

    getFavourites();
  }

  // get favourites
  void getFavourites() {
    favourites = getFavouriteUseCase(userId);

    emit(FavouriteLoaded(favourites));
  }

  // check if favourite
  bool isFavourite(String productId) {
    return isFavouriteUseCase(productId, userId);
  }

  // toggle favourite
  Future<void> toggleFavourite(ProductEntity product) async {
    if (isFavourite(product.id)) {
      await removeFavouriteUseCase(
        product.id,
        userId,
      );
    } else {
      await addFavouriteUseCase(
        product,
        userId,
      );
    }

    getFavourites();
  }
}
