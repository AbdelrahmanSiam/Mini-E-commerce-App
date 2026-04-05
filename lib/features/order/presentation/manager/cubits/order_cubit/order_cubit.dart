import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';
import 'package:mini_ecommerce/features/order/domain/use_cases/submit_order_parameters.dart';
import 'package:mini_ecommerce/features/order/domain/use_cases/submit_order_use_case.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final SubmitOrderUseCase submitOrderUseCase;
  OrderCubit({required this.submitOrderUseCase}) : super(OrderInitialState());

  Future<void> submitOrder({
    required String address,
    required String phone,
    required List<Map<String, dynamic>> products,
    required double total,
  }) async {
    emit(OrderLoadingState());
    final result = await submitOrderUseCase(
      SubmitOrderParams(
        address: address,
        phone: phone,
        products: products,
        total: total,
      ),
    );
    result.fold(
      (failure) => emit(OrderFailureState(errMessage: failure.errMessage)),
      (order) => emit(OrderSuccessState(order: order)),
    );
  }
}