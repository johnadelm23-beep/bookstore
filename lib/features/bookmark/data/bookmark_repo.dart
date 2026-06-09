import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';

class BookMarkRepo {
  /// ================= SHOW BOOKMARK =================
  static Future<ProductsResponse?> showBookMark() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.showBookMark);

      if (response?.statusCode == 200) {
        return ProductsResponse.fromJson(response?.data);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  /// ================= ADD =================
  static Future<bool> addToFavourite({required int bookId}) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.addFavourite,
        data: {"product_id": bookId},
      );

      return response?.statusCode == 200 || response?.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  /// ================= REMOVE =================
  static Future<bool> removeFromFavorite({required int bookId}) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.removeFavorite,
        data: {"product_id": bookId},
      );

      return response?.statusCode == 200 || response?.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
