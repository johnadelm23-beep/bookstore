import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';

class CartRepo {
  static Future<bool> addToCart({required int productId}) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": productId},
      );
      if (response?.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
