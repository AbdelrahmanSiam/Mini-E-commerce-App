import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  const CartImage({super.key, required this.image});
 final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported_outlined, size: 24),
              ),
            ),
          );
  }
}