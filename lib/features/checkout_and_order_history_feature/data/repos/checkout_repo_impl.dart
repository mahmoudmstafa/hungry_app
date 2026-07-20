import '../../domain/entities/order_entity.dart';
import '../../domain/repos/checkout_repo.dart';
import '../data_sources/local_data_source/checkout_local_data_source.dart';
import '../models/order_model.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutLocalDataSource localDataSource;

  CheckoutRepoImpl({
    required this.localDataSource,
  });

  @override
  Future<void> placeOrder(OrderEntity order) async {
    await localDataSource.placeOrder(
      OrderModel.fromEntity(order),
    );
  }

  @override
  List<OrderEntity> getOrders(String userId) {
    return localDataSource.getOrders(userId);
  }

  @override
  Future<void> clearCart(String userId) {
    return localDataSource.clearCart(userId);
  }
}