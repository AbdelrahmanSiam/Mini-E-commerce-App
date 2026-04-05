import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SuccessProductsView extends StatelessWidget {
  const SuccessProductsView({
    super.key, required this.isLoading, required this.products,
  });
 final bool isLoading;
 final List<ProductEntity> products;

  static const ProductEntity _placeholder = ProductEntity(
    id: 0,
    title: '',
    price: 0,
    image: '',
    category: '',
    inStock: true,
  );

  List<ProductEntity> get _gridProducts {
    if (isLoading && products.isEmpty) {
      return List<ProductEntity>.filled(6, _placeholder);
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final gridProducts = _gridProducts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Text(
            isLoading && products.isEmpty
                ? 'Loading products…'
                : '${products.length} products found',
            style: AppStyles.labelSemiBold13(context),
          ),
        ),
        Expanded(
          child: Skeletonizer(
            enabled: isLoading,
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: gridProducts.length,
              itemBuilder: (context, index) {
                final product = gridProducts[index];
                return ProductCard(
                  product: product,
                  onAddToCart: () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}