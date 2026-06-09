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
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(100),
            child: Image.network(user.image),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(user.name, style: TextStyle(fontSize: 20.sp)),
            SizedBox(height: 10.h),
            Text(
              user.email,
              style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    );
  }
}
