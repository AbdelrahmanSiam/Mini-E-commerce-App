import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.labelSemiBold13(context),
        ),
        Text(
          value,
          style:AppStyles.labelSemiBold13(context),
        ),
      ],
    );;
  }
}