import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.isCenterTitle = false, this.title = ''});

  final bool isCenterTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey),
            ),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),

        if (isCenterTitle) ...[
          SizedBox(width: 20.w),

          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
