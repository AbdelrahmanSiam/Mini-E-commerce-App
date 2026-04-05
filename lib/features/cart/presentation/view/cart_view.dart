import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/cart/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('My Cart', style: TextStyle(color: Colors.black)),
      ),
      body: CartViewBody(),
    );
  }
}
