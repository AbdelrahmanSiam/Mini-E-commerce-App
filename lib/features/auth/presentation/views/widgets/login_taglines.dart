import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';

class AuthTaglines extends StatelessWidget {
  const AuthTaglines({
    super.key,
    required this.tagline1,
    required this.tagline2,
  });
  final String tagline1, tagline2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(tagline1, style: AppStyles.textPrimary20(context)),
        const SizedBox(height: 4),
        Text(tagline2, style: AppStyles.labelSemiBold13(context)),
      ],
    );
  }
}
