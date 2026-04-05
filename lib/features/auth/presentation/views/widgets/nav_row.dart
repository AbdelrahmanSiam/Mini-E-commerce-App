import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

class NavRow extends StatelessWidget {
  const NavRow({
    super.key,
    required this.pageTagline,
    required this.buttonName,
  });
  final String pageTagline, buttonName;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(pageTagline, style: AppStyles.labelSemiBold13(context)),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.register);
            },
            child: Text(
              buttonName,
              style: AppStyles.labelSemiBold13(
                context,
              ).copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
