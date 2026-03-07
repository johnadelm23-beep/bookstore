import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            "Hello! Register to get started",
            style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(hintText: "Username"),
          SizedBox(height: 11.h),
          CustomTextFormField(hintText: "Email"),
          SizedBox(height: 11.h),
          CustomTextFormField(hintText: "Password", obscureText: true),
          SizedBox(height: 11.h),
          CustomTextFormField(hintText: "Confirm Password", obscureText: true),
          SizedBox(height: 30.h),
          AppButton(text: "Register"),
          SizedBox(height: 220.h),
          Row(
            mainAxisAlignment: .center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    TextSpan(
                      text: "Login Now",
                      style: TextStyle(
                        fontSize: 16.sp,
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
