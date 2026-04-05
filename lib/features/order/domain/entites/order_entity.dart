class OrderEntity {
  final int id;
  final String address;
  final String phone;
  final List<Map<String, dynamic>> products;
  final double total;

  const OrderEntity({
    required this.id,
    required this.address,
    required this.phone,
    required this.products,
    required this.total,
  });
}