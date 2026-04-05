import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({super.key, required this.title, required this.price});
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.labelSemiBold13(context),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: AppStyles.priceBold16(context),
        ),
      ],
    );
  }
}
