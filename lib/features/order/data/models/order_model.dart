import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.address,
    required super.phone,
    required super.products,
    required super.total,
  });

  factory OrderModel.fromJson(
    Map<String, dynamic> json, {
    required String address,
    required String phone,
    required double total,
  }) {
    return OrderModel(
      id: json['id'] ?? 0,
      address: address,
      phone: phone,
      products:
          (json['products'] as List?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      total: total,
    );
  }
}
