
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/features/order/presentation/views/widgets/detail_row.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.orderId,
    required this.itemsCount,
    required this.total,
    required this.address,
  });

  final dynamic orderId;
  final dynamic itemsCount;
  final dynamic total;
  final dynamic address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          DetailRow(label: 'Order ID', value: '#$orderId'),
          const SizedBox(height: 10),
          DetailRow(label: 'Items', value: '$itemsCount items'),
          const SizedBox(height: 10),
          DetailRow(
            label: 'Total',
            value: '\$${(total as double).toStringAsFixed(2)}',
          ),
          const SizedBox(height: 10),
          DetailRow(
            label: 'Delivery address',
            value: address.isNotEmpty ? address : '—',
          ),
          const SizedBox(height: 10),
          const DetailRow(
            label: 'Estimated delivery',
            value: '3–5 business days',
          ),
        ],
      ),
    );
  }
}

