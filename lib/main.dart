import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_theme.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/login_view.dart';

void main() {
  runApp(const MiniECommerce());
}

class MiniECommerce extends StatelessWidget {
  const MiniECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home: LoginView(),
    );
  }
}
