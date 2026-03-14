import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
              LocaleKeys.forgetPassord.tr(),
              style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
            ),
            SizedBox(height: 10.h),
            Text(
              LocaleKeys.forgetPasswordMessage.tr(),
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
            CustomTextFormField(hintText: LocaleKeys.eneterEmail.tr()),
            SizedBox(height: 35.h),
            AppButton(text: LocaleKeys.sendCode.tr()),
            Spacer(),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.remember.tr(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    TextSpan(
                      text: LocaleKeys.login.tr(),
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
