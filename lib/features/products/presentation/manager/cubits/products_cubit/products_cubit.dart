import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/use_case/use_case.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/domain/use_cases/fetch_products_use_case.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FetchProductsUseCase fetchProductsUseCase;
  ProductsCubit({required this.fetchProductsUseCase})
    : super(ProductsInitialState());

  Future<void> fetchProducts() async {
    emit(ProductsLoadingState());
    final result = await fetchProductsUseCase(NoParams());
    result.fold(
      (failure) => emit(ProductsFailureState(errMessage: failure.errMessage)),
      (products) => emit(ProductsSuccessState(products: products)),
    );
  }
}
