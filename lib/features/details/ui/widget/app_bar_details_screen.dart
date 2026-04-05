import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarDetailsScreen extends StatelessWidget {
  const AppBarDetailsScreen({super.key});

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
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        Spacer(),
        SvgPicture.asset(
          'assets/icons/BookMark.svg',
          width: 20.w,
          height: 20.h,
        ),
      ],
    );
  }
}
