import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerProducts extends StatelessWidget {
  const CustomContainerProducts({super.key, required this.products});
  final Product products;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 11.96.h, left: 10.96.w, right: 10.96.w),
      width: 162.w,
      height: 281.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.backGroundContainerItem,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Image.network(products.image, width: 140.w, height: 175.28.h),
          Expanded(
            child: Text(products.name, style: TextStyle(fontSize: 20.sp)),
          ),
          Row(
            children: [
              Expanded(child: Text(products.price)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  minimumSize: Size(72.23.w, 27.9.h),
                ),
                onPressed: () {},
                child: Text(
                  "Buy",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
