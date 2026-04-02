import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );
      if (response?.statusCode == 200) {
        saveUserToken(token: response?.data['data']['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> register({
    required String name,
    required String email,
    required String confirmPassword,
    required String password,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.regiter,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );
      if (response?.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      return false;
    }
  }

  static Future<void> saveUserToken({required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
