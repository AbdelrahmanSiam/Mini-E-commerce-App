import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/domain/repo/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsRemoteDataSource remoteDataSource;
  ProductsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    try {
      final products = await remoteDataSource.fetchProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
