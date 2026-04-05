import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class StockBadge extends StatelessWidget {
  const StockBadge({super.key, required this.inStock});

  final bool inStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: inStock
            ? AppColors.success.withValues(alpha: 0.12)
            : AppColors.error.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        inStock ? 'In stock' : 'Out of stock',
        style: AppStyles.taglineRegular11(
          context,
        ).copyWith(color: inStock ? AppColors.success : AppColors.error),
      ),
    );
  }
}
