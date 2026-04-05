import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsViewBody(),
    );
  }
}