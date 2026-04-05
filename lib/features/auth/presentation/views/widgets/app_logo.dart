import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.iconColor,
    this.backgroundColor = AppColors.primaryLight,
  });
  final Color iconColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.shopping_bag, color: iconColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text('ShopMate', style: AppStyles.appNameBold32(context)),
      ],
    );
  }
}
