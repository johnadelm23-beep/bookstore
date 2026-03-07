import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 68.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomAppBar(),
            SizedBox(height: 15.h),
            Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
            CustomTextFormField(hintText: "Enter your email"),
            SizedBox(height: 35.h),
            AppButton(text: "Send Code"),
            Spacer(),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Remember Password? ",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
