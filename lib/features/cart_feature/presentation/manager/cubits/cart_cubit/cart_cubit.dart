import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cart_item_entity.dart';
import '../../../../domain/use_cases/add_to_cart_use_case.dart';
import '../../../../domain/use_cases/clear_cart_item_use_case.dart';
import '../../../../domain/use_cases/get_cart_items_use_case.dart';
import '../../../../domain/use_cases/remove_cart_item_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.addToCartUseCase,
    required this.getCartItemsUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase, required this.firebaseAuth,
  }) : super(CartInitial());

  final FirebaseAuth firebaseAuth;
  String get userId => firebaseAuth.currentUser!.uid;
  final AddToCartUseCase addToCartUseCase;

  final GetCartItemsUseCase getCartItemsUseCase;

  final RemoveCartItemUseCase removeCartItemUseCase;

  final ClearCartUseCase clearCartUseCase;

  Future<void> addToCart(CartItemEntity item) async {
    await addToCartUseCase(item);

    emit(CartSuccess());

    getCartItems();
  }

  void getCartItems() {
    final items = getCartItemsUseCase(
      userId
    );

    emit(
      CartLoaded(items),
    );
  }

  Future<void> removeItem(int index) async {
    await removeCartItemUseCase(index);

    getCartItems();
  }

  Future<void> clearCart() async {
    await clearCartUseCase(
      userId
    );

    emit(CartLoaded([]));
  }
}