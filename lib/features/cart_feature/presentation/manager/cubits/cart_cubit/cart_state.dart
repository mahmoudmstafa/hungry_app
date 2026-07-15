part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccess extends CartState {}

final class CartLoaded extends CartState {
  final List<CartItemEntity> items;

  CartLoaded(this.items);
}