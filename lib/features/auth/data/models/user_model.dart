import 'package:mini_ecommerce/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token'] ?? '');
  }
}