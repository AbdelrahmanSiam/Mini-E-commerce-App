class CartItemEntity {
  final int id;
  final String title;
  final double price;
  final String image;
  final int quantity;

  const CartItemEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  // To change quantity without new object (shared by reference)
  CartItemEntity copyWith({int? quantity}) {
    return CartItemEntity(
      id: id,
      title: title,
      price: price,
      image: image,
      quantity: quantity ?? this.quantity,
    );
  }
}