import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_ecommerce/core/constants/constant.dart';

class LocalStorageService {

  Box get box => Hive.box(boxName);

  Future<void> saveToken(String token) async {
    await box.put(tokenKey, token);
  }

  String? getToken() {
    return box.get(tokenKey);
  }

  Future<void> clearToken() async {
    await box.delete(tokenKey);
  }

  bool isLoggedIn() {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }
}