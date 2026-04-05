import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/di/setup_service_locator.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:mini_ecommerce/features/products/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('ShopMate', style: AppStyles.appNameBold32(context)),
      ),
      body: BlocProvider(
        create: (context) => getIt<ProductsCubit>(),
        child: ProductsViewBody(),
      ),
    );
  }
}
