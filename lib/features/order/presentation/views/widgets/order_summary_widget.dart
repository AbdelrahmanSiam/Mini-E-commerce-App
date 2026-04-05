import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';

class OrderSummaryWidget extends StatelessWidget {
  final List<CartItemEntity> items;
  final double total;

  const OrderSummaryWidget({
    super.key,
    required this.items,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order summary', style: AppStyles.buttonSemiBold15(context)),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${item.title} x${item.quantity}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.labelSemiBold13(context),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                  style: AppStyles.labelSemiBold13(context),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: AppStyles.buttonSemiBold15(context)),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: AppStyles.priceBold16(context),
            ),
          ],
        ),
      ],
    );
  }
}
