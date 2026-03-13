import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart';
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
    // TODO: implement dispose
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
            "Hello! Register to get started",
            style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            hintText: "Username",
            isPassword: false,
            controller: userNameController,
          ),
          SizedBox(height: 11.h),
          CustomTextFormField(
            hintText: "Email",
            isPassword: false,
            controller: emailController,
          ),
          SizedBox(height: 11.h),
          CustomTextFormField(
            hintText: "Password",
            isPassword: true,
            controller: passwordControoler,
          ),
          SizedBox(height: 11.h),
          CustomTextFormField(
            hintText: "Confirm Password",
            isPassword: true,
            controller: confirmPassordControoler,
          ),
          SizedBox(height: 30.h),
          AppButton(
            text: "Register",
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
