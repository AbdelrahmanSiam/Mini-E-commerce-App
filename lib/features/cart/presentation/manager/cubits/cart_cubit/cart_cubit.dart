import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/cart/domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  final List<CartItemEntity> _items = [];

  List<CartItemEntity> get items => List.unmodifiable(_items);

  void addItem(CartItemEntity item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(item);
    }
    _emitUpdated();
  }

  void removeItem(int id) {
    _items.removeWhere((e) => e.id == id);
    _emitUpdated();
  }

  void increaseQuantity(int id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      _emitUpdated();
    }
  }

  void decreaseQuantity(int id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index != -1) {
      if (_items[index].quantity <= 1) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(
          quantity: _items[index].quantity - 1,
        );
      }
      _emitUpdated();
    }
  }

  void clearCart() {
    _items.clear();
    _emitUpdated();
  }

  void _emitUpdated() {
    final total = _items.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    emit(CartUpdatedState(items: List.from(_items), total: total));
  }
}
