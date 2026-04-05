import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.productImage});

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: const BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.network(
            productImage,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
