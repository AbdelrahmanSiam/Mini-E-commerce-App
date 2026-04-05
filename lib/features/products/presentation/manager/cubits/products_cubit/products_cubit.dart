import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());
}
