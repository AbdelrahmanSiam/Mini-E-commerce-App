import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/widgets/custom_app_button.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/forget_password.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            label: 'FULL NAME',
            hint: 'Abdelrahman Ahmed',
            prefixIcon: Icons.person_outline,
            controller: nameController,
            validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
          ),
          const SizedBox(height: 12),
          AuthTextField(
            label: 'EMAIL',
            hint: 'abdo@gmail.com',
            prefixIcon: Icons.email_outlined,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (v) =>
                v == null || !v.contains('@') ? 'Enter valid email' : null,
          ),
          const SizedBox(height: 12),
          AuthTextField(
            label: 'PASSWORD',
            hint: '****',
            prefixIcon: Icons.lock_outline,
            controller: passwordController,
            isPassword: true,
            validator: (v) =>
                v == null || v.length < 4 ? 'Min 4 characters' : null,
          ),
          const SizedBox(height: 12),
          AuthTextField(
            label: 'CONFIRM PASSWORD',
            hint: '****',
            prefixIcon: Icons.lock_outline,
            controller: confirmController,
            isPassword: true,
            validator: (v) =>
                v != passwordController.text ? 'Passwords do not match' : null,
          ),
          const SizedBox(height: 24),
          CustomButton(
            isLoading: false,
            buttonName: 'Register',
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
