import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:book_stroe/features/welcome/ui/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'DM'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: startScreen(),
      ),
    );
  }

  Widget startScreen() {
    if (ApiConstants.token == null) {
      return WelcomeScreen();
    } else {
      return BottomNavBarScreen();
    }
  }
}
