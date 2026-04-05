import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/core/di/setup_service_locator.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/widgets/app_snack_bar.dart';
import 'package:mini_ecommerce/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:mini_ecommerce/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              GoRouter.of(context).push(AppRouter.products);
            } else if (state is AuthFailureState) {
              AppSnackBar.showError(context, state.errMessage);
            }
          },
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
