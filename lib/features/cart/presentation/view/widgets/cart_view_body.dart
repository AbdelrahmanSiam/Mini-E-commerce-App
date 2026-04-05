import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/cart/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/cart/presentation/view/widgets/empty_cart_widget.dart';
import 'cart_item_widget.dart';
import 'cart_bottom_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartInitialState ||
            (state is CartUpdatedState && state.items.isEmpty)) {
          return EmptyCartWidget();
        }
        final items = (state as CartUpdatedState).items;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return CartItemWidget(
                    item: item,
                    onIncrease: () =>
                        context.read<CartCubit>().increaseQuantity(item.id),
                    onDecrease: () =>
                        context.read<CartCubit>().decreaseQuantity(item.id),
                    onRemove: () =>
                        context.read<CartCubit>().removeItem(item.id),
                  );
                },
              ),
            ),
            CartBottomBar(total: state.total, onCheckout: () {}),
          ],
        );
      },
    );
  }
}
