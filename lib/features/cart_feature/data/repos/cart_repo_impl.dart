import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repos/cart_repo.dart';
import '../data_sources/local_data_source/local_data_source.dart';
import '../models/cart_item_model.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource localDataSource;

  CartRepoImpl({
    required this.localDataSource,
  });


  // add to cart
  @override
  Future<void> addToCart(CartItemEntity item, userId) {
    return localDataSource.addToCart(
      CartItemModel.fromEntity(item),
      userId,
    );
  }

  // get cart items
  @override
  List<CartItemEntity> getCartItems(userId) {
    return localDataSource.getCartItems(userId);
  }

  // remove item
  @override
  Future<void> removeCartItem(int index, userId) {
    return localDataSource.removeItem(index, userId);
  }

  // clear cart
  @override
  Future<void> clearCart(userId) {
    return localDataSource.clearCart(userId);
  }

  // update item
  @override
  Future<void> updateItem(
      CartItemEntity item,
      int index,
      String userId,
      ) {
    return localDataSource.updateItem(
      CartItemModel.fromEntity(item),
      index,
      userId,
    );
  }
}
