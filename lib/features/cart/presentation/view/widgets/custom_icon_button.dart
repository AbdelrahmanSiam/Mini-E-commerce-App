import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.filled,
  });
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : Colors.transparent,
          shape: BoxShape.circle,
          border: filled ? null : Border.all(color: AppColors.border),
        ),
        child: Icon(
          icon,
          size: 14,
          color: filled ? Colors.white : AppColors.textPrimary,
        ),
      ),
    );
  }
}
