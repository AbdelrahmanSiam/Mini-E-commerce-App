import 'package:mini_ecommerce/core/services/api_server.dart';
import 'package:mini_ecommerce/features/products/data/models/product_model.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductEntity>> fetchProducts();
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final ApiService apiService;
  ProductsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final data = await apiService.get(endPoint: '/products');
    final list = data['products'] as List;
    return list.map((item) => ProductModel.fromJson(item)).toList();
  }
}
