import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Image.asset(
          'assets/images/splash/bookialogo.png',
          width: 100.w,
          height: 100.h,
        ),
        SvgPicture.asset('assets/icons/search-normal.svg'),
      ],
    );
  }
}
