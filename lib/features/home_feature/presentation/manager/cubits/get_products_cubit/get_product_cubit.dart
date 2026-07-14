import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/use_cases/get_products_use_case.dart';
import '../../../../domain/use_cases/params/page_params.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit({required this.getProductsUseCase})
    : super(GetProductInitial());

  final GetProductsUseCase getProductsUseCase;

  List<ProductEntity> products = [];
  int currentPage = 1;
  int total = 0;
  bool isFetchingMore = false;

  bool get hasMore => products.length < total;
  String? selectedCategoryId;

  Future<void> getProducts({String? categoryId}) async {
    currentPage = 1;
    selectedCategoryId = categoryId;

    final cached = categoryId == null
        ? getProductsUseCase.getCachedProducts()
        : <ProductEntity>[];

    if (cached.isNotEmpty) {
      products = _removeDuplicateProducts(cached);
      emit(
        GetProductsSuccess(
          products: products,
          hasMore: false,
          isFromCache: true,
        ),
      );
    } else {
      emit(GetProductsLoading());
    }

    final result = await getProductsUseCase.call(
      PageParams(page: 1, categoryId: categoryId),
    );

    result.fold(
      (failure) {
        if (cached.isEmpty) {
          emit(GetProductsFailure(errMessage: failure.errMessage));
        }
      },
      (data) {
        products = _removeDuplicateProducts(data.products);
        total = data.total;
        emit(
          GetProductsSuccess(
            products: products,
            hasMore: hasMore,
            isFromCache: false,
          ),
        );
      },
    );
  }

  Future<void> loadNextPage() async {
    if (isFetchingMore || !hasMore) return;

    isFetchingMore = true;
    emit(GetProductsLoadingMore(products: products));

    final nextPage = currentPage + 1;
    final result = await getProductsUseCase(
      PageParams(page: nextPage, categoryId: selectedCategoryId),
    );

    result.fold(
      (failure) {
        isFetchingMore = false;
        emit(
          GetProductsPaginationError(
            products: products,
            errMessage: failure.errMessage,
          ),
        );
      },
      (data) {
        currentPage = nextPage;

        // ندمج القائمة القديمة مع الجديدة، وبعدين نشيل أي تكرار من النتيجة كلها
        final combinedProducts = [...products, ...data.products];
        products = _removeDuplicateProducts(combinedProducts);

        total = data.total;
        isFetchingMore = false;
        emit(GetProductsSuccess(products: products, hasMore: hasMore));
      },
    );
  }

  // دالة مساعدة بسيطة بتشيل أي منتج بنفس الـ id لو اتكرر، وبتحتفظ بأول ظهور بس
  List<ProductEntity> _removeDuplicateProducts(
    List<ProductEntity> productsList,
  ) {
    final seenIds = <String>{};
    final uniqueProducts = <ProductEntity>[];

    for (final product in productsList) {
      if (seenIds.contains(product.id)) {
        continue;
      }
      seenIds.add(product.id);
      uniqueProducts.add(product);
    }

    return uniqueProducts;
  }
}
