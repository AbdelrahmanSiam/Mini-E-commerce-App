import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/widgets/custom_view_body.dart';
import 'package:mini_ecommerce/core/widgets/customa_auth_card.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/app_logo.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        children: [
          AppLogo(),
          AuthCard(children: [
            
          ],)
        ],
      ),
    );
  }
}
