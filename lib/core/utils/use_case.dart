

import 'package:fpdart/fpdart.dart';

import '../../features/aut_feature/domain/entities/user_entity.dart';
import 'failures.dart';

abstract class  UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}


class NoParams {
  const NoParams();
}