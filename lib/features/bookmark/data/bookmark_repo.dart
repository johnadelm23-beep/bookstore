import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';

class BookMarkRepo {
  static Future<dynamic> addToFavourite({required int bookId}) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.addFavourite,
        data: {"product_id": bookId},
      );
      if (response?.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> removeFromFavorite({required int bookId}) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.removeFavorite,
        data: {"product_id": bookId},
      );
      if (response?.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
