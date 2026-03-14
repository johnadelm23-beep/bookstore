import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SiginChooseContainer extends StatelessWidget {
  const SiginChooseContainer({
    super.key,
    required this.iconSign,
    required this.text,
  });
  final String iconSign;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          SvgPicture.asset(iconSign, width: 26.w, height: 26.h),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(fontSize: 15.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
