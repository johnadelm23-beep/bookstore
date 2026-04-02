import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:book_stroe/features/register/cubit/auth_cubit.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 68.h),
        children: [
          const CustomAppBar(),
          SizedBox(height: 15.h),
          Text(
            LocaleKeys.registerMessage.tr(),
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.h),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: LocaleKeys.userName.tr(),
                  isPassword: false,
                  controller: userNameController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                ),
                SizedBox(height: 11.h),
                CustomTextFormField(
                  hintText: LocaleKeys.email.tr(),
                  isPassword: false,
                  controller: emailController,
                  validator: (value) => value == null || !value.contains('@')
                      ? 'Please enter a valid email'
                      : null,
                ),
                SizedBox(height: 11.h),
                CustomTextFormField(
                  hintText: LocaleKeys.password.tr(),
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) => value == null || value.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                SizedBox(height: 11.h),
                CustomTextFormField(
                  hintText: LocaleKeys.confirm.tr(),
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) => value != passwordController.text
                      ? 'Passwords do not match'
                      : null,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (c) =>
                      const Center(child: CircularProgressIndicator()),
                );
              } else if (state is AuthErrorState) {
                Navigator.pop(context); // Close loading dialog
                showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text(LocaleKeys.errorLabel).tr(),
                    content: const Text(LocaleKeys.errorMessage).tr(),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(c),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else if (state is AuthSuccessState) {
                Navigator.pop(context); // Close loading dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (c) => const BottomNavBarScreen()),
                );
              }
            },
            child: AppButton(
              text: LocaleKeys.register.tr(),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().register(
                    name: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                }
              },
            ),
          ),
          SizedBox(height: 220.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
