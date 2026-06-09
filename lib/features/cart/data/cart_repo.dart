import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/cart/data/model/cart_model.dart';

class CartRepo {
  static Future<CartResponseModel?> getCart() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.cart);

      return CartResponseModel.fromJson(response!.data);
    } catch (e) {
      return null;
    }
  }

  static Future<CartResponseModel?> removeCart({required int itemId}) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.removeCart,
        data: {"cart_item_id": itemId},
      );

      return CartResponseModel.fromJson(response!.data);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": productId},
      );

      return response?.statusCode == 200 || response?.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  static Future<CartResponseModel?> updateCart({
    required int itemId,
    required int quantity,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.updateCart,
        data: {"cart_item_id": itemId, "quantity": quantity},
      );

      return CartResponseModel.fromJson(response!.data);
    } catch (e) {
      print("UPDATE CART ERROR: $e");
      return null;
    }
  }
}
