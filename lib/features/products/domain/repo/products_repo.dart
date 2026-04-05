import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();
}