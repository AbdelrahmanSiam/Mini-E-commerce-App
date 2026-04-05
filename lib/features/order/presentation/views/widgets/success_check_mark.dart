import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class SuccessCheckMark extends StatelessWidget {
  const SuccessCheckMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check_circle_outline,
        size: 56,
        color: AppColors.primary,
      ),
    );
  }
}
