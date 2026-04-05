part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}
final class CartUpdatedState extends CartState {
  final List<CartItemEntity> items;
  final double total;
  CartUpdatedState({required this.items, required this.total});
}