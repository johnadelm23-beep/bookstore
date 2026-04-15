import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';

class BookMarkRepo {
  static Future<ProductsResponse?>? showBookMark() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.showBookMark);
      if (response?.statusCode == 200) {
        final ProductsResponse data = ProductsResponse.fromJson(response?.data);
        return data;
      } else
        return null;
    } catch (e) {
      return null;
    }
  }

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
