import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordControoler = TextEditingController();
  var confirmPassordControoler = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordControoler.dispose();
    emailController.dispose();
    confirmPassordControoler.dispose();
    super.dispose();
  }

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
            LocaleKeys.registerMessage.tr(),
            style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            hintText: LocaleKeys.userName.tr(),
            isPassword: false,
            controller: userNameController,
          ),
          SizedBox(height: 11.h),
          CustomTextFormField(
            hintText: LocaleKeys.email.tr(),
            isPassword: false,
            controller: emailController,
          ),
          SizedBox(height: 11.h),
          CustomTextFormField(
            hintText: LocaleKeys.password.tr(),
            isPassword: true,
            controller: passwordControoler,
          ),
          SizedBox(height: 11.h),
          CustomTextFormField(
            hintText: LocaleKeys.confirm.tr(),
            isPassword: true,
            controller: confirmPassordControoler,
          ),
          SizedBox(height: 30.h),
          AppButton(
            text: LocaleKeys.register.tr(),
            onTap: () async {
              await register();
            },
          ),
          SizedBox(height: 220.h),
          Row(
            mainAxisAlignment: .center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.alreadyHaveAccount.tr(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    TextSpan(
                      text: LocaleKeys.registerLogin.tr(),
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

  register() async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
        'https://codingarabic.online/api/register',
        data: {
          "name": userNameController.text,
          "email": emailController.text,
          "password": passwordControoler.text,
          "password_confirmation": confirmPassordControoler.text,
        },
      );
      print("SUCCESS: ${response.statusCode}");
    } on DioException catch (e) {
      if (e.response != null) {
        print("SERVER ERROR: ${e.response!.data}");
      } else {
        print("ERROR: $e");
      }
    }
  }
}
