import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:book_stroe/features/profile/data/models/user_model.dart';

class ProfileRepo {
  static Future<ProfileResponse?> editProfile({
    required String name,
    required String address,
    required String city,
    required String phone,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.updateProfile,
        data: {"name": name, "address": address, "city": city, "phone": phone},
      );
      if (response!.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<ProfileResponse?>? showProfile() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.profile);
      if (response!.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
