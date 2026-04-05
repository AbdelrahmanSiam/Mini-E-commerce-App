import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/register_view.dart';
import 'package:mini_ecommerce/features/cart/presentation/view/cart_view.dart';
import 'package:mini_ecommerce/features/products/presentation/products_view.dart';
import '../../features/auth/presentation/views/login_view.dart';

abstract class AppRouter {
  static const String login = '/login';
  static const String register = '/register';
  static const String products = '/products';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String confirmation = '/confirmation';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(path: login, builder: (_, __) => const LoginView()),
      GoRoute(path: register, builder: (_, __) => const RegisterView()),
      GoRoute(path: products, builder: (_, __) => const ProductsView()),
      GoRoute(path: cart, builder: (_, __) => const CartView()),
    ],
  );
}
