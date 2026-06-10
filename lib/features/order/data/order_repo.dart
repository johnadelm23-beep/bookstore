import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/order/data/models/order_model.dart';

class OrderRepo {
  static Future<OrderHistoryModel?> getOrderHistory() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.orderHistory);

      return OrderHistoryModel.fromJson(response!.data);
    } catch (e) {
      return null;
    }
  }
}
