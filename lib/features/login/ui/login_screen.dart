import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/forgot/ui/forgot_screen.dart';
import 'package:book_stroe/features/login/ui/widgets/sigin_choose_container.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 22.w,
            right: 22.w,
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),

              SizedBox(height: 15.h),

              Text(
                "Welcome back! Glad to see you, Again!",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15.h),

              CustomTextFormField(
                hintText: "Enter your email",
                isPassword: false,
                controller: emailController,
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                hintText: "Enter your Password",
                controller: passwordController,
                isPassword: true,
              ),

              SizedBox(height: 9.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => const ForgotScreen()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              AppButton(
                text: LocaleKeys.login.tr(),
                onTap: () async {
                  await login();
                },
              ),

              SizedBox(height: 44.h),

              Row(
                children: [
                  SizedBox(
                    width: 112.w,
                    child: const Divider(color: Colors.grey),
                  ),
                  SizedBox(width: 40.w),
                  Text(
                    "Or",
                    style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                  ),
                  SizedBox(width: 45.w),
                  SizedBox(
                    width: 111.w,
                    child: const Divider(color: Colors.grey),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
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

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    Dio dio = Dio();
    final response = await dio.post(
      'https://codingarabic.online/api/login',
      data: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
    print(response.statusCode.toString());
  }
}
