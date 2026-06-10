import 'package:book_stroe/features/cart/data/model/checkout_model.dart';
import 'package:book_stroe/features/cart/data/model/govern_model.dart';
import 'package:book_stroe/features/cart/data/model/place_order_model.dart';
import 'package:dio/dio.dart';
import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';

class CheckoutRepo {
  static Future<CheckoutModel?> checkout() async {
    try {
      final response = await DioHelper.dio!.get(ApiConstants.checkout);
      return CheckoutModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  static Future<PlaceOrderModel?> placeOrder({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String governorateId,
  }) async {
    try {
      final response = await DioHelper.dio!.post(
        ApiConstants.placeOrder,
        data: {
          "name": name,
          "address": address,
          "phone": phone,
          "email": email,
          "governorate_id": governorateId,
        },
      );

      return PlaceOrderModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  static Future<List<GovernorateModel>?> getGovernorates() async {
    try {
      final response = await DioHelper.dio!.get(ApiConstants.governs);

      final List data = response.data['data'];

      return data.map((e) => GovernorateModel.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }
}
