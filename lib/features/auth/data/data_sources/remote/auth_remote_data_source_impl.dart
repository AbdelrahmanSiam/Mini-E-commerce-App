import 'package:mini_ecommerce/core/services/api_server.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:mini_ecommerce/features/auth/data/models/user_model.dart';
import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<UserEntity> login({
    required String username,
    required String password,
  }) async {
    final data = await apiService.post(
      endPoint: '/auth/login',
      body: {'username': username, 'password': password, 'expiresInMins': 60},
    );
    return UserModel.fromJson(data);
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return UserModel(token: 'user_${DateTime.now().millisecondsSinceEpoch}');
  }
}
