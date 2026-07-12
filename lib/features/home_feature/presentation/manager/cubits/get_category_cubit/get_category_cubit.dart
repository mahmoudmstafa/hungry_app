import 'package:bloc/bloc.dart';
import 'package:hungry_app/features/home_feature/domain/use_cases/get_categories_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utils/use_case.dart';
import '../../../../domain/entities/category_entity.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit({required this.getCategories}) : super(GetCategoryInitial());
  final GetCategoriesUseCase getCategories;

  Future<void> fetchCategories() async {
    emit(GetCategoryLoading());

    final result = await getCategories.call(NoParams());

    result.fold(
      (failure) => emit(
        GetCategoryError(message: failure.errMessage),
      ),
      (categories) => emit(
        GetCategoryLoaded(
          categories: categories,
        ),
      ),
    );
  }
}
