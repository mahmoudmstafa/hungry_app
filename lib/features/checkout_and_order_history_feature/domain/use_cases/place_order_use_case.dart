import '../entities/order_entity.dart';
import '../repos/checkout_repo.dart';

class PlaceOrderUseCase {
  final CheckoutRepo repo;

  PlaceOrderUseCase(this.repo);

  Future<void> call(OrderEntity order) {
    return repo.placeOrder(order);
  }
}