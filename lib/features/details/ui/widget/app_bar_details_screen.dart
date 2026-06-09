import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarDetailsScreen extends StatefulWidget {
  const AppBarDetailsScreen({super.key, required this.isBookMark, this.onTap});

  final bool isBookMark;
  final void Function()? onTap;

  @override
  State<AppBarDetailsScreen> createState() => _AppBarDetailsScreenState();
}

class _AppBarDetailsScreenState extends State<AppBarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.black),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 16),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: widget.onTap,
          child: SvgPicture.asset(
            'assets/icons/BookMark.svg',
            width: 20.w,
            height: 20.h,
            colorFilter: ColorFilter.mode(
              widget.isBookMark ? AppColors.primaryColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

