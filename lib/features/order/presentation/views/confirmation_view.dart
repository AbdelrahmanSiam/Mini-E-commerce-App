import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/order/presentation/views/widgets/confirmation_view_body.dart';

class ConfirmationView extends StatelessWidget {
  final Map<String, dynamic> orderData;
  const ConfirmationView({super.key, required this.orderData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ConfirmationViewBody(orderData: orderData));
  }
}
