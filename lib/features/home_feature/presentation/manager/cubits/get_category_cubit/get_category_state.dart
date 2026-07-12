part of 'get_category_cubit.dart';

@immutable
sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}
final class GetCategoryLoading extends GetCategoryState {}

final class GetCategoryLoaded extends GetCategoryState {
  final List<CategoryEntity> categories;

  GetCategoryLoaded({required this.categories});
}

final class GetCategoryError extends GetCategoryState {
  final String message;

  GetCategoryError({required this.message});
}