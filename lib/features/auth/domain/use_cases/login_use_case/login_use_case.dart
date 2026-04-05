import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/core/use_case/use_case.dart';
import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repo/auth_repo.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/login_use_case/login_parameterts.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) {
    return authRepo.login(
      username: params.username,
      password: params.password,
    );
  }
}