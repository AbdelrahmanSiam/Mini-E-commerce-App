import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/core/use_case/use_case.dart';
import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/repo/auth_repo.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/register_use_case/register_parameters.dart';

class RegisterUseCase extends UseCase<UserEntity, RegisterParams> {
  final AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) {
    return authRepo.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
