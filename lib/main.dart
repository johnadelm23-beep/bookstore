import 'package:book_stroe/book_store.dart';
import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/helper/dio_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  DioHelper.initDio();
  ApiConstants.token = prefs.getString('token');
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: BookStore(),
    ),
  );
}

/*

dart run build_runner build --delete-conflicting-outputs
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
 */
