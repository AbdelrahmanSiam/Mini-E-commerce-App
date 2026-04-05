import 'package:mini_ecommerce/core/services/api_server.dart';
import 'package:mini_ecommerce/features/order/data/data_sources/order_remote_data_source.dart';
import 'package:mini_ecommerce/features/order/data/models/order_model.dart';
import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;
  OrderRemoteDataSourceImpl({required this.apiService});

  @override
  Future<OrderEntity> submitOrder({
    required String address,
    required String phone,
    required List<Map<String, dynamic>> products,
    required double total,
  }) async {
    final data = await apiService.post(
      endPoint: '/carts',
      body: {
        'userId': 1,
        'date': DateTime.now().toIso8601String(),
        'products': products,
      },
    );
    return OrderModel.fromJson(
      data,
      address: address,
      phone: phone,
      total: total,
    );
  }
}
