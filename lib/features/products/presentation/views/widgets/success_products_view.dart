import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/widgets/app_snack_bar.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';
import 'package:mini_ecommerce/features/cart/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SuccessProductsView extends StatelessWidget {
  const SuccessProductsView({
    super.key,
    required this.isLoading,
    required this.products,
  });
  final bool isLoading;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Text(
            '${products.length} products found',
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
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onAddToCart: () {
                    context.read<CartCubit>().addItem(
                      CartItemEntity(
                        id: product.id,
                        title: product.title,
                        price: product.price,
                        image: product.image,
                        quantity: 1,
                      ),
                    );
                    AppSnackBar.showInfo(context, 'Added to cart');
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
