part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitialState extends OrderState {}
final class OrderLoadingState extends OrderState {}
final class OrderSuccessState extends OrderState {
  final OrderEntity order;
  OrderSuccessState({required this.order});
}
final class OrderFailureState extends OrderState {
  final String errMessage;
  OrderFailureState({required this.errMessage});
}