import 'package:book_stroe/features/profile/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.grey.shade300,
          child: Icon(IconlyLight.profile, size: 50.r, color: Colors.black),
        ),
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(user.name, style: TextStyle(fontSize: 20.sp)),
            SizedBox(height: 10.h),
            Text(
              user.email,
              style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
            ),
          ],
        ),
      ],
    );
  }
}
