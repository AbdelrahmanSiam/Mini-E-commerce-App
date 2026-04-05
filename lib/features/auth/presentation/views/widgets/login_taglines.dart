import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';

class LoginTaglines extends StatelessWidget {
  const LoginTaglines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Welcome back', style: AppStyles.textPrimary20(context)),
        const SizedBox(height: 4),
        Text('Sign in to continue', style: AppStyles.labelSemiBold13(context)),
      ],
    );
  }
}
