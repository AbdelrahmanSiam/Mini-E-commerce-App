import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderEntity>> submitOrder({
    required String address,
    required String phone,
    required List<Map<String, dynamic>> products,
    required double total,
  });
}