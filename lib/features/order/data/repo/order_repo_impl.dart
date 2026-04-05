import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';
import 'package:mini_ecommerce/features/order/domain/repo/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final OrderRemoteDataSource remoteDataSource;
  OrderRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, OrderEntity>> submitOrder({
    required String address,
    required String phone,
    required List<Map<String, dynamic>> products,
    required double total,
  }) async {
    try {
      final order = await remoteDataSource.submitOrder(
        address: address,
        phone: phone,
        products: products,
        total: total,
      );
      return right(order);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
