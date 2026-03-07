import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/forgot/ui/forgot_screen.dart';
import 'package:book_stroe/features/login/ui/widgets/sigin_choose_container.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 68.h),
        children: [
          CustomAppBar(),
          SizedBox(height: 15.h),
          Text(
            "Welcome back! Glad to see you, Again!",
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.black,
              fontWeight: .bold,
            ),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(hintText: "Enter your name"),
          SizedBox(height: 10.h),
          CustomTextFormField(
            hintText: "Enter your Password",
            obscureText: true,
            suffixIcon: Icons.visibility,
          ),
          SizedBox(height: 9.h),
          Row(
            mainAxisAlignment: .end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => ForgotScreen()),
                  );
                },
                child: Container(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          AppButton(text: LocaleKeys.login.tr()),
          SizedBox(height: 44.h),
          Row(
            children: [
              SizedBox(
                width: 112.w,
                child: Divider(color: Colors.grey),
              ),
              SizedBox(width: 40.w),
              Text(
                "Or",
                style: TextStyle(fontSize: 20.sp, color: Colors.grey),
              ),
              SizedBox(width: 45.w),
              SizedBox(
                width: 111.w,
                child: Divider(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          SiginChooseContainer(
            iconSign: "assets/icons/google.svg",
            text: "Sign in with Google",
          ),
          SizedBox(height: 15.h),
          SiginChooseContainer(
            iconSign: "assets/icons/apple.svg",
            text: "Sign in with Apple",
          ),
          SizedBox(height: 80.h),

          Row(
            mainAxisAlignment: .center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    TextSpan(
                      text: " Register Now",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
