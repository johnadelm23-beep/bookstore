import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/register/cubit/auth_cubit.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is AuthLoadingState){
                showDialog(context: context, builder: (c)=>Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)));

              }else if(state is AuthErrorState){
                Navigator.pop(context);
                showDialog(context: context, builder: (c)=>AlertDialog(
                  title: Text('error'),
                  content: Text('Something is wrong please try again'),
                ));
              }else if(state is AuthSuccessState){
                Navigator.pop(context);
                showDialog(context: context, builder: (c)=>AlertDialog(
                  title: Text('Success'),
                  content: Text('Created account successfully!'),
                ));
              }
              // TODO: implement listener
            },
            child: AppButton(
              text: LocaleKeys.register.tr(),
              onTap: () async {
               context.read<AuthCubit>().register(name:userNameController.text, email: emailController.text, password: passwordControoler.text, confirmPassword: confirmPassordControoler.text);
              },
            ),
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


}
