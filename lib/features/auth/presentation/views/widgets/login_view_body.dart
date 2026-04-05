import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/core/widgets/custom_view_body.dart';
import 'package:mini_ecommerce/core/widgets/customa_auth_card.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/login_fields.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/login_taglines.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/nav_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLogo(iconColor: AppColors.primary),
          const SizedBox(height: 16),
          AuthCard(
            children: [
              AuthTaglines(
                tagline1: 'Welcome back',
                tagline2: 'Sign in to continue',
              ),
              const SizedBox(height: 24),
              LoginFields(),
              const SizedBox(height: 16),
              NavRow(
                pageTagline: "Don't have an account? ",
                buttonName: 'Register',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.register);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
