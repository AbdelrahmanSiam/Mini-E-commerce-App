class SubmitOrderParams {
  final String address;
  final String phone;
  final List<Map<String, dynamic>> products;
  final double total;

  const SubmitOrderParams({
    required this.address,
    required this.phone,
    required this.products,
    required this.total,
  });
}