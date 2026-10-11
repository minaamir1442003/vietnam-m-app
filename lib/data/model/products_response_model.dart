
class GetProductsResponseModel {
  final bool status;
  final String message;
  final ProductListDataModel data;

  GetProductsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetProductsResponseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return GetProductsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: ProductListDataModel.fromJson(json['data']),
    );
  }
}

class ProductListDataModel {
  final int id;
  final String name;
  final String? image;
  final List<ProductModel> products;

  ProductListDataModel({
    required this.id,
    required this.name,
    this.image,
    required this.products,
  });

  factory ProductListDataModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return ProductListDataModel(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'],

      products: (json['products'] as List<dynamic>? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}
class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String? image;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0',
      image: json['image'],
    );
  }
}
