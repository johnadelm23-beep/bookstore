import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemListContainer extends StatelessWidget {
  const CustomItemListContainer({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade300,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            Icon(Icons.arrow_right_outlined, size: 30.r),
          ],
        ),
      ),
    );
  }
}
