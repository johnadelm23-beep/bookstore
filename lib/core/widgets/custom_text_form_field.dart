import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = true,
    this.validator,
  });
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && isObsecure,
      onTapOutside: (v) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
                child: isObsecure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: AppColors.textFieldColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
