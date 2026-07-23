import 'package:fpdart/fpdart.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../entities/product_entity.dart';
import '../repos/home_repo.dart';

class SearchProductsUseCase {
  final HomeRepo homeRepo;

  SearchProductsUseCase({required this.homeRepo});

  Future<Either<AppFailures, List<ProductEntity>>> call(String searchQuery) async {
    return await homeRepo.searchProducts(
      searchQuery: searchQuery,
    );
  }
}
