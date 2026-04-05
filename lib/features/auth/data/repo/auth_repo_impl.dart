import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/core/services/local_storage_service.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorageService localStorageService;

  AuthRepoImpl({
    required this.remoteDataSource,
    required this.localStorageService,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        username: username,
        password: password,
      );
      await localStorageService.saveToken(user.token);
      return right(user);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );
      await localStorageService.saveToken(user.token);
      return right(user);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}