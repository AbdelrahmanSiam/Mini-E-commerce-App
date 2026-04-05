import 'package:mini_ecommerce/features/products/domain/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.image,
    required super.category,
    required super.inStock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      image: json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      inStock: (json['stock'] as int? ?? 1) > 0,
    );
  }
}
