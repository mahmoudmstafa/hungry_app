import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hungry_app/features/product_details_feature/data/models/side_options_model.dart';
import 'package:hungry_app/features/product_details_feature/data/models/toppings_model.dart';

import '../../../../core/utils/failures.dart';
import '../../domain/repos/side_options_and_toppings_repo_repo.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';

class SideOptionsAndToppingsRepoRepoImpl implements SideOptionsAndToppingsRepo {
  final ToppingRemoteDataSource remoteDataSource;

  SideOptionsAndToppingsRepoRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ToppingModel>>> getToppings() async {
    try {
      final toppings = await remoteDataSource.getToppings();

      return Right(toppings);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<SideOptionsModel>>> getSideOptions() async {
    try {
      final sideOptions = await remoteDataSource.getSideOptions();

      return Right(sideOptions);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
