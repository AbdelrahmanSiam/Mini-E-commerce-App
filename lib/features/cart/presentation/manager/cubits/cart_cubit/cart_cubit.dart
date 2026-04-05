import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
}
