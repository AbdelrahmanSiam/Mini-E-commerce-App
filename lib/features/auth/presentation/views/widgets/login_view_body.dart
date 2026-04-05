import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/core/widgets/custom_view_body.dart';
import 'package:mini_ecommerce/core/widgets/customa_auth_card.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/login_fields.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/login_taglines.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/nav_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          AppLogo(),
          AuthCard(
            children: [
              LoginTaglines(),
              const SizedBox(height: 24),
              LoginFields(),
              const SizedBox(height: 16),
              NavRow(
                pageTagline: "Don't have an account? ",
                buttonName: 'Register',
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
