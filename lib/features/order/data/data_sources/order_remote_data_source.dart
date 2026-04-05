import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';

abstract class OrderRemoteDataSource {
  Future<OrderEntity> submitOrder({
    required String address,
    required String phone,
    required List<Map<String, dynamic>> products,
    required double total,
  });
}