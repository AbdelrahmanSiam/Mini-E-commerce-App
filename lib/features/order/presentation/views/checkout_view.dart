import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/di/setup_service_locator.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';
import 'package:mini_ecommerce/features/order/presentation/manager/cubits/order_cubit/order_cubit.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  final List cartItems;

  const CheckoutView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OrderCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: CheckoutViewBody(
          cartItems: cartItems.cast<CartItemEntity>(),
        ),
      ),
    );
  }
}