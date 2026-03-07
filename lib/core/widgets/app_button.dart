import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.backGround, required this.text, this.onTap});
  final Color? backGround;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 19.h),
        decoration: BoxDecoration(
          border: backGround != null ? Border.all(color: Colors.black) : null,
          borderRadius: BorderRadius.circular(8),
          color: backGround ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            text.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              color: backGround == null ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
