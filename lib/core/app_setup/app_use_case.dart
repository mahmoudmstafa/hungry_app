

import 'package:fpdart/fpdart.dart';

import 'app_failures.dart';

abstract class  AppUseCase<Type, Params> {
  Future<Either<AppFailures, Type>> call(Params params);
}


class NoParams<Type> {
  const NoParams();
}