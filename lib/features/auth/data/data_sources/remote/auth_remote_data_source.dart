import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login({
    required String username,
    required String password,
  });

  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
  });
}
