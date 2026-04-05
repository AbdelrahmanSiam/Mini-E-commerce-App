import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/widgets/custom_app_button.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/forget_password.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            label: 'USER NAME',
            hint: 'Username',
            prefixIcon: Icons.person_outline,
            controller: usernameController,
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter your username' : null,
          ),
          const SizedBox(height: 16),
          AuthTextField(
            label: 'PASSWORD',
            hint: 'Password',
            prefixIcon: Icons.lock_outline,
            controller: passwordController,
            isPassword: true,
            validator: (value) =>
                value == null || value.length < 4 ? 'Min 4 characters' : null,
          ),
          ForgetPassword(),
          const SizedBox(height: 16),
          CustomButton(
            isLoading: false,
            buttonName: 'Sign in',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // go to home
              }
            },
          ),
        ],
      ),
    );
  }
}
