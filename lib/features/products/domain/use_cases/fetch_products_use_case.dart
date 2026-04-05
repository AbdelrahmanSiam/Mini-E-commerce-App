import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/core/use_case/use_case.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/domain/repo/products_repo.dart';

class FetchProductsUseCase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepo productsRepo;
  FetchProductsUseCase({required this.productsRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return productsRepo.fetchProducts();
  }
}