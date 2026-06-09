class CartResponseModel {
  final CartData data;
  final String message;
  final List<dynamic> error;
  final int status;

  CartResponseModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      data: CartData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'],
    );
  }
}

class CartData {
  final int id;
  final UserModel user;
  final String total;
  final List<CartItemModel> cartItems;

  CartData({
    required this.id,
    required this.user,
    required this.total,
    required this.cartItems,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      total: json['total'],
      cartItems: List<CartItemModel>.from(
        json['cart_items'].map((e) => CartItemModel.fromJson(e)),
      ),
    );
  }
}

class UserModel {
  final int userId;
  final String userName;

  UserModel({required this.userId, required this.userName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(userId: json['user_id'], userName: json['user_name']);
  }
}

class CartItemModel {
  final int itemId;
  final int productId;
  final String productName;
  final String productImage;
  final String productPrice;
  final int productDiscount;
  final double productPriceAfterDiscount;
  final int productStock;
  final int quantity;
  final double total;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDiscount,
    required this.productPriceAfterDiscount,
    required this.productStock,
    required this.quantity,
    required this.total,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['item_product_id'],
      productName: json['item_product_name'],
      productImage: json['item_product_image'],
      productPrice: json['item_product_price'],
      productDiscount: json['item_product_discount'],
      productPriceAfterDiscount:
          (json['item_product_price_after_discount'] as num).toDouble(),
      productStock: json['item_product_stock'],
      quantity: json['item_quantity'],
      total: (json['item_total'] as num).toDouble(),
    );
  }
}
