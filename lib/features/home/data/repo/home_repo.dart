import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/home/data/model/slider_model.dart';

class HomeRepo {
  static Future<SliderResponse?>? getSlider() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.slider);
      if (response?.statusCode == 200) {
        SliderResponse data = SliderResponse.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<ProductsResponse?>? getProducts() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.products);
      if (response?.statusCode == 200) {
        ProductsResponse data = ProductsResponse.fromJson(response?.data);
        print("Success ================================");
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
