import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/core/widgets/custom_view_body.dart';
import 'package:mini_ecommerce/core/widgets/customa_auth_card.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/login_taglines.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: AuthCard(
        children: [
          AppLogo(iconColor: Colors.white, backgroundColor: AppColors.primary),
          const SizedBox(height: 24),
          AuthTaglines(
            tagline1: 'Create account',
            tagline2: 'Fill in your details below',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
