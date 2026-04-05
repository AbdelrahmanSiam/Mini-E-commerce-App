import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.primary,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text('ShopMate', style: AppStyles.appNameBold32(context)),
      ],
    );
  }
}
