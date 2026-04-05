import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/widgets/custom_app_button.dart';
import 'package:mini_ecommerce/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
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
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLogin() {
    if (!formKey.currentState!.validate()) return;
    context.read<AuthCubit>().login(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            label: 'USER NAME',
            hint: 'Abderlahman',
            prefixIcon: Icons.person_outline,
            controller: usernameController,
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter your username' : null,
          ),
          const SizedBox(height: 16),
          AuthTextField(
            label: 'PASSWORD',
            hint: '****',
            prefixIcon: Icons.lock_outline,
            controller: passwordController,
            isPassword: true,
            validator: (value) =>
                value == null || value.length < 4 ? 'Min 4 characters' : null,
          ),
          ForgetPassword(),
          const SizedBox(height: 16),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AuthLoadingState,
                buttonName: 'Sign in',
                onPressed: onLogin,
              );
            },
          ),
        ],
      ),
    );
  }
}
