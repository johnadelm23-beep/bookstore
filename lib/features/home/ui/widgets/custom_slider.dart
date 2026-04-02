import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/home/data/model/slider_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int activeIndex = 0;
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
              autoPlayInterval: Duration(seconds: 2),
              viewportFraction: 1,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),

            items: widget.sliders.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.network(i.image ?? "", fit: BoxFit.cover);
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 10.h),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.sliders.length,

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
