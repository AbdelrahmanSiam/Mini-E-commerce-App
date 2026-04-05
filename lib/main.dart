import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/theme/app_theme.dart';

void main() {
  runApp(const MiniECommerce());
}

class MiniECommerce extends StatelessWidget {
  const MiniECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      routerConfig: AppRouter.router,
    );
  }
}
