import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(12.r),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 180.0.h,
              autoPlay: true,
              viewportFraction: 1,
              enableInfiniteScroll: true,
            ),

            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.network(
                    "https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg",
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 10.h),
        AnimatedSmoothIndicator(
          activeIndex: 5,
          count: 6,

          effect: ExpandingDotsEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,

            activeDotColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
