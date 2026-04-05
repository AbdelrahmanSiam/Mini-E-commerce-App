import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  });

  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  });
}