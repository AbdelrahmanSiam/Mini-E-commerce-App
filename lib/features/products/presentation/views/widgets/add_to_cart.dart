
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.inStock,
    required this.onAddToCart,
  });

  final bool inStock;
  final void Function() onAddToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: inStock ? onAddToCart : null,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: inStock
              ? AppColors.primary
              : AppColors.border,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          size: 18,
          color: inStock
              ? Colors.white
              : AppColors.textSecondary,
        ),
      ),
    );
  }
}
