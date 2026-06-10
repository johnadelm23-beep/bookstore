import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:book_stroe/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Vector.svg",
                    width: 120.w,
                    height: 120.h,
                  ),

                  SvgPicture.asset(
                    "assets/icons/Vector (1).svg",
                    width: 50.w,
                    height: 50.h,
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Text(
                "SUCCESS!",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Your order will be delivered soon.Thank you for choosing our app!",
                style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade400),
              ),
              SizedBox(height: 50.h),
              //Spacer(),
              AppButton(
                text: "Return to Home",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (c) => const BottomNavBarScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
