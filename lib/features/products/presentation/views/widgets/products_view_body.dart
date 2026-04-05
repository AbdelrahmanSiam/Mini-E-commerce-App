import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/product_card.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/success_products_view.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessProductsView();
  }
}
