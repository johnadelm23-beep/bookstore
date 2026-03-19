import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/features/login/ui/login_screen.dart';
import 'package:book_stroe/features/register/ui/register_screen.dart';
import 'package:book_stroe/gen/assets.gen.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.welcom.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                crossAxisAlignment: .end,
                mainAxisAlignment: .end,
                children: [
                  IconButton(
                    onPressed: () {
                      if (context.locale.languageCode == "ar") {
                        context.setLocale(Locale("en"));
                      } else {
                        context.setLocale(Locale("ar"));
                      }
                    },
                    icon: Icon(Icons.language),
                  ),
                ],
              ),
              SizedBox(height: 105.h),
              Assets.images.splash.bookialogo.image(),
              SizedBox(height: 28.h),
              Expanded(
                child: Text(
                  LocaleKeys.welcomeMessage.tr(),
                  style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
                ),
              ),
              AppButton(
                text: LocaleKeys.login,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(height: 9.h),
              AppButton(
                text: LocaleKeys.register,
                backGround: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => RegisterScreen()),
                  );
                },
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
