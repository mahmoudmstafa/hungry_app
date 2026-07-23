import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/product_details_feature/data/models/side_options_model.dart';
import 'package:hungry_app/features/product_details_feature/data/models/toppings_model.dart';

import '../../../../core/app_setup/app_failures.dart';
import '../../domain/repos/side_options_and_toppings_repo_repo.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';

class SideOptionsAndToppingsRepoRepoImpl implements SideOptionsAndToppingsRepo {
  final ToppingRemoteDataSource remoteDataSource;

  SideOptionsAndToppingsRepoRepoImpl({
    required this.remoteDataSource,
  });

  // get all toppings
  @override
  Future<Either<AppFailures, List<ToppingModel>>> getToppings() async {
    try {
      final toppings = await remoteDataSource.getToppings();

      return Right(toppings);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on AppFailures catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        AppFailures(
          errMessage: e.toString(),
        ),
      );
    }
  }

  // get all side options
  @override
  Future<Either<AppFailures, List<SideOptionsModel>>> getSideOptions() async {
    try {
      final sideOptions = await remoteDataSource.getSideOptions();

      return Right(sideOptions);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on AppFailures catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        AppFailures(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
