part of 'get_toppings_cubit.dart';

@immutable
sealed class GetToppingsState {}

final class GetToppingsStateInitial extends GetToppingsState {}



final class GetToppingsLoading extends GetToppingsState {}

final class GetToppingsLoaded extends GetToppingsState {
  final List<ToppingModel> toppings;

  GetToppingsLoaded({required this.toppings});
}

final class GetToppingsError extends GetToppingsState {
  final String message;

  GetToppingsError({required this.message});
}



