import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';
import 'package:mini_ecommerce/features/cart/presentation/view/widgets/cart_image.dart';
import 'package:mini_ecommerce/features/cart/presentation/view/widgets/cart_info.dart';
import 'package:mini_ecommerce/features/cart/presentation/view/widgets/custom_icon_button.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });
  final CartItemEntity item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CartImage(image: item.image),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartInfo(title: item.title, price: item.price),
                Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.remove,
                      onTap: onDecrease,
                      filled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${item.quantity}',
                        style: AppStyles.bodyMediumRegular14(context),
                      ),
                    ),
                    CustomIconButton(
                      icon: Icons.add,
                      onTap: onIncrease,
                      filled: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
