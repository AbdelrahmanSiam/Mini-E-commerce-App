import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final raw = json['accessToken'] ?? json['token'];
    return UserModel(token: raw?.toString() ?? '');
  }
}