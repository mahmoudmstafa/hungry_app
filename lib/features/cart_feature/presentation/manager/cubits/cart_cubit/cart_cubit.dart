import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cart_item_entity.dart';
import '../../../../domain/use_cases/add_to_cart_use_case.dart';
import '../../../../domain/use_cases/clear_cart_item_use_case.dart';
import '../../../../domain/use_cases/get_cart_items_use_case.dart';
import '../../../../domain/use_cases/remove_cart_item_use_case.dart';
import '../../../../domain/use_cases/updata_cart_item_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.addToCartUseCase,
    required this.getCartItemsUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase,
    required this.firebaseAuth,
    required this.updateCartItemUseCase,
  }) : super(CartInitial());

  final FirebaseAuth firebaseAuth;
  final UpdateCartItemUseCase updateCartItemUseCase;

  String get userId => firebaseAuth.currentUser!.uid;

  final AddToCartUseCase addToCartUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;

  List<CartItemEntity> cartItems = [];

  // methods

  // add to cart
  Future<void> addToCart(CartItemEntity item) async {
    await addToCartUseCase(item, userId);

    emit(CartSuccess());

    getCartItems();
  }

  // get cart items
  void getCartItems() {
    cartItems = getCartItemsUseCase(userId);

    emit(CartLoaded(cartItems));
  }

  // delete item
  Future<void> deleteItem(int index) async {
    await removeCartItemUseCase(
      index,
      userId,
    );

    getCartItems();
  }

  // clear cart
  Future<void> clearCart() async {
    await clearCartUseCase(userId);

    cartItems.clear();

    emit(CartLoaded([]));
  }


  // total price
  double get totalPrice {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice * item.quantity;
    }

    return total;
  }

  // increase quantity
  Future<void> increaseQuantity(int index) async {
    final item = cartItems[index];

    item.quantity++;

    await updateCartItemUseCase(
      item,
      index,
      userId,
    );

    getCartItems();
  }

  // decrease quantity
  Future<void> decreaseQuantity(int index) async {
    final item = cartItems[index];

    if (item.quantity == 1) return;

    item.quantity--;

    await updateCartItemUseCase(
      item,
      index,
      userId,
    );

    getCartItems();
  }
}
