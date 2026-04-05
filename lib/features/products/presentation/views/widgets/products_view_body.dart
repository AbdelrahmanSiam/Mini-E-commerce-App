import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/failure_products_view.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/success_products_view.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState || state is ProductsInitialState) {
          return SuccessProductsView(isLoading: true, products: []);
        }
        if (state is ProductsFailureState) {
          return FailureProductsView(errMessage: state.errMessage);
        }
        if (state is ProductsSuccessState) {
          return SuccessProductsView(
            isLoading: false,
            products: state.products,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
