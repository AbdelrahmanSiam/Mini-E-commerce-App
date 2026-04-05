import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());
}
