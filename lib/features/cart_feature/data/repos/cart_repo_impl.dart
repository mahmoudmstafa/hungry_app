import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repos/cart_repo.dart';
import '../data_sources/local_data_source/local_data_source.dart';
import '../models/cart_item_model.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource localDataSource;

  CartRepoImpl({
    required this.localDataSource,
  });

  @override
  Future<void> addToCart(CartItemEntity item) {
    return localDataSource.addToCart(
      CartItemModel.fromEntity(item),
    );
  }

  @override
  List<CartItemEntity> getCartItems(userId) {
    return localDataSource.getCartItems(userId);
  }

  @override
  Future<void> removeCartItem(int index) {
    return localDataSource.removeItem(index);
  }

  @override
  Future<void> clearCart(userId) {
    return localDataSource.clearCart(userId);
  }
}
