class Product {
  final int id;
  final String name;
  final String description;
  final String price;
  final int discount;
  final double priceAfterDiscount;
  final int stock;
  final int bestSeller;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.bestSeller,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      priceAfterDiscount: (json['price_after_discount'] as num).toDouble(),
      stock: json['stock'],
      bestSeller: json['best_seller'],
      image: json['image'],
      category: json['category'],
    );
  }
}

class ProductsData {
  final List<Product> products;

  ProductsData({required this.products});

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
      products: List<Product>.from(
        json['products'].map((e) => Product.fromJson(e)),
      ),
    );
  }
}

class ProductsResponse {
  final ProductsData data;
  final int status;

  ProductsResponse({required this.data, required this.status});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      data: ProductsData.fromJson(json['data']),
      status: json['status'],
    );
  }
}
