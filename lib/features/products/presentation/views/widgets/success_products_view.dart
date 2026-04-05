
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/product_card.dart';

class SuccessProductsView extends StatelessWidget {
  const SuccessProductsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Text(
            '5 products found',
            style: AppStyles.labelSemiBold13(context),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return ProductCard(
                product: ProductEntity(
                  id: 1,
                  title: "Car",
                  price: 15.2,
                  image: "",
                  category: "Cars",
                  inStock: true,
                ),
                onAddToCart: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}