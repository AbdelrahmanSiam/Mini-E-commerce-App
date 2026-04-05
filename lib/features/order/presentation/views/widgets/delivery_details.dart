import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/core/router/app_router.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';
import 'package:mini_ecommerce/core/widgets/app_snack_bar.dart';
import 'package:mini_ecommerce/core/widgets/custom_app_button.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';
import 'package:mini_ecommerce/features/cart/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:mini_ecommerce/features/order/presentation/manager/cubits/order_cubit/order_cubit.dart';
import 'package:mini_ecommerce/features/order/presentation/views/widgets/order_summary_widget.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  double get _total => widget.cartItems.fold(
    0,
    (sum, item) => sum + (item.price * item.quantity),
  );

  void _onPlaceOrder() {
    if (!_formKey.currentState!.validate()) return;

    final products = widget.cartItems
        .map((item) => {'productId': item.id, 'quantity': item.quantity})
        .toList();

    context.read<OrderCubit>().submitOrder(
      address: _addressController.text.trim(),
      phone: _phoneController.text.trim(),
      products: products,
      total: _total,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccessState) {
          context.read<CartCubit>().clearCart();
          context.go(
            AppRouter.confirmation,
            extra: {
              'orderId': state.order.id,
              'itemsCount': widget.cartItems.length,
              'total': _total,
              'address': _addressController.text.trim(),
            },
          );
        } else if (state is OrderFailureState) {
          AppSnackBar.showError(context, state.errMessage);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _addressController,
              maxLines: 3,
              validator: (v) =>
                  v == null || v.isEmpty ? 'Enter delivery address' : null,
              decoration: const InputDecoration(
                hintText: 'Delivery address',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              validator: (v) =>
                  v == null || v.length < 8 ? 'Enter valid phone number' : null,
              decoration: const InputDecoration(
                hintText: 'Phone number',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            OrderSummaryWidget(items: widget.cartItems, total: _total),
            const SizedBox(height: 32),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is OrderLoadingState,
                  buttonName: 'Place order',
                  onPressed: _onPlaceOrder,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
