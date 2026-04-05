import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/styles/app_styles.dart';
import 'package:mini_ecommerce/features/order/presentation/views/widgets/order_details_card.dart';
import 'package:mini_ecommerce/features/order/presentation/views/widgets/success_check_mark.dart';

class ConfirmationViewBody extends StatelessWidget {
  const ConfirmationViewBody({super.key, required this.orderData});
  final Map<String, dynamic> orderData;
  @override
  Widget build(BuildContext context) {
    final orderId = orderData['orderId'] ?? 0;
    final itemsCount = orderData['itemsCount'] ?? 0;
    final total = orderData['total'] ?? 0.0;
    final address = orderData['address'] ?? '';
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),
            SuccessCheckMark(),
            const SizedBox(height: 24),
            Text('Order placed!', style: AppStyles.statValueBold24(context)),
            const SizedBox(height: 8),
            Text(
              'Thank you for your order',
              style: AppStyles.bodyMediumRegular14(context),
            ),
            const SizedBox(height: 32),
            OrderDetailsCard(
              orderId: orderId,
              itemsCount: itemsCount,
              total: total,
              address: address,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.products),
              child: const Text('Continue shopping'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
