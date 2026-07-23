import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../cart_feature/domain/use_cases/clear_cart_item_use_case.dart';
import '../../../domain/entities/order_entity.dart';
import '../../../domain/use_cases/get_orders_use_case.dart';
import '../../../domain/use_cases/place_order_use_case.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({
    required this.placeOrderUseCase,
    required this.getOrdersUseCase,
    required this.clearCartUseCase,
    required this.firebaseAuth,
  }) : super(CheckoutInitial());

  final PlaceOrderUseCase placeOrderUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final ClearCartUseCase clearCartUseCase;
  final FirebaseAuth firebaseAuth;

  String get userId => firebaseAuth.currentUser!.uid;

  List<OrderEntity> orders = [];

  OrderEntity? currentOrder;


  // place (add) order
  Future<void> placeOrder(OrderEntity order) async {
    emit(CheckoutLoading());

    await placeOrderUseCase(order);

    await clearCartUseCase(userId);

    currentOrder = order;

    emit(CheckoutSuccess());
  }

  // get orders
  void getOrders() {
    orders = getOrdersUseCase(userId);

    emit(CheckoutLoaded(orders));
  }
}