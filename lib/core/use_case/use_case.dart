import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams {}