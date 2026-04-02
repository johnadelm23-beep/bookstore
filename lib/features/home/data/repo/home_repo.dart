import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
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
}
