import 'package:dio/dio.dart';

class AuthRepo {
  Dio dio = Dio();

  Future<void>? login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        "https://codingarabic.online/api/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {

      } else {

      }
    } catch (e) {
      print(e);
    }
  }
}
