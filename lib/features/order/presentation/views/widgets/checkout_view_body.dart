import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';
import 'package:mini_ecommerce/features/order/presentation/views/widgets/delivery_details.dart';

class CheckoutViewBody extends StatelessWidget {
  final List<CartItemEntity> cartItems;

  const CheckoutViewBody({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery details',
            style: AppStyles.buttonSemiBold15(context),
          ),
          const SizedBox(height: 12),
          DeliveryDetails(cartItems: cartItems),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
