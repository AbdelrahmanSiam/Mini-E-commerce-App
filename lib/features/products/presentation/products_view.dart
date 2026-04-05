import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/di/setup_service_locator.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/features/cart/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/cart_icon.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'ShopMate',
            style: AppStyles.statValueBold24(
              context,
            ).copyWith(color: AppColors.primary),
          ),
          actions: [
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final count = state is CartUpdatedState
                    ? state.items.length
                    : 0;
                return CartIcon(count: count);
              },
            ),
          ],
        ),
        body: ProductsViewBody(),
      ),
    );
  }
}
