import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/order/data/models/order_model.dart';

class OrderRepo {
  static Future<OrdersResponse?>? getOrderHistory() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.orderHistory);
      if (response == 200) {
        return OrdersResponse.fromJson(response!.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
