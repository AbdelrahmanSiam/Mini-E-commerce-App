import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/errors/failure.dart';
import 'package:mini_ecommerce/core/use_case/use_case.dart';
import 'package:mini_ecommerce/features/order/domain/entites/order_entity.dart';
import 'package:mini_ecommerce/features/order/domain/repo/order_repo.dart';
import 'package:mini_ecommerce/features/order/domain/use_cases/submit_order_parameters.dart';

class SubmitOrderUseCase extends UseCase<OrderEntity, SubmitOrderParams> {
  final OrderRepo orderRepo;
  SubmitOrderUseCase({required this.orderRepo});

  @override
  Future<Either<Failure, OrderEntity>> call(SubmitOrderParams params) {
    return orderRepo.submitOrder(
      address: params.address,
      phone: params.phone,
      products: params.products,
      total: params.total,
    );
  }
}