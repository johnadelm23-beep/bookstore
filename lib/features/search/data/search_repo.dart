import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';

class SearchRepo {
  static Future<ProductsResponse?>? search({required String text}) async {
    try {
      final response = await DioHelper.dio?.get(
        ApiConstants.search,
        queryParameters: {"name": text},
      );
      if (response?.statusCode == 200) {
        ProductsResponse data = ProductsResponse.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
