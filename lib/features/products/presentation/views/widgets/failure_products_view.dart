import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';

class FailureProductsView extends StatelessWidget {
  const FailureProductsView({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.textSecondary),
            const SizedBox(height: 12),
            Text(
              errMessage,
              style: AppStyles.bodyMediumRegular14(context),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ProductsCubit>().fetchProducts(),
              style: ElevatedButton.styleFrom(minimumSize: const Size(140, 44)),
              child: const Text('Retry'),
            ),
          ],
      ),
    );
  }
}