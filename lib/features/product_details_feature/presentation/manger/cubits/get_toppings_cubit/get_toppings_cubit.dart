import 'package:bloc/bloc.dart';
import 'package:hungry_app/features/product_details_feature/data/models/side_options_model.dart';
import 'package:hungry_app/features/product_details_feature/data/models/toppings_model.dart';
import 'package:meta/meta.dart';

import '../../../../domain/use_cases/get_side_options_use_case.dart';
import '../../../../domain/use_cases/get_toppings_use_case.dart';

part 'get_toppings_state.dart';

class GetToppingsCubit extends Cubit<GetToppingsState> {
  GetToppingsCubit({
    required this.getToppingsUseCase,
  }) : super(GetToppingsStateInitial());
  final GetToppingsUseCase getToppingsUseCase;

  // toppings
  Future<void> getToppings() async {
    emit(GetToppingsLoading());

    final result = await getToppingsUseCase();

    result.fold(
      (failure) => emit(
        GetToppingsError(message: failure.errMessage),
      ),
      (toppings) => emit(
        GetToppingsLoaded(
          toppings: toppings,
        ),
      ),
    );
  }
}
