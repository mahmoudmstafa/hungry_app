import '../entities/order_entity.dart';
import '../repos/checkout_repo.dart';

class GetOrdersUseCase {
  final CheckoutRepo repo;

  GetOrdersUseCase(this.repo);

  List<OrderEntity> call(String userId) {
    return repo.getOrders(userId);
  }
}