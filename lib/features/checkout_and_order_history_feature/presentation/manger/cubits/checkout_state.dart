part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}
final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
  final List<OrderEntity> orders;

  CheckoutLoaded(this.orders);
}