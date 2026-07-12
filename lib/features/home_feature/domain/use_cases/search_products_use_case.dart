import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failures.dart';
import '../entities/product_entity.dart';
import '../repos/home_repo.dart';

class SearchProductsUseCase {
  final HomeRepo homeRepo;

  SearchProductsUseCase({required this.homeRepo});

  Future<Either<Failure, List<ProductEntity>>> call(String searchQuery) async {
    return await homeRepo.searchProducts(
      searchQuery: searchQuery,
    );
  }
}
