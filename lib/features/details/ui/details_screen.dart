import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/custom_network_image.dart';
import 'package:book_stroe/features/details/ui/widget/app_bar_details_screen.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.product});
  final Product? product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isMark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              SizedBox(height: 3.h),
              AppBarDetailsScreen(
                isBookMark: isMark,
                onTap: () {
                  if (isMark) {
                    context.read<HomeCubitCubit>().addFavorite(
                      bookId: widget.product?.id ?? 0,
                    );
                  } else {
                    context.read<HomeCubitCubit>().removeFavorite(
                      bookId: widget.product?.id ?? 0,
                    );
                  }
                  setState(() {
                    isMark = !isMark;
                  });
                },
              ),
              SizedBox(height: 10.h),
              Center(
                child: Container(
                  width: 183.w,
                  height: 271.h,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.r),
                    child: CustomNetworkImage(
                      imageUrl: widget.product?.image ?? "",
                      width: 183.w,
                      hight: 271.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10.h),
              Center(
                child: Text(
                  widget.product?.name ?? "test",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                widget.product?.category ?? "Error",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: Text(
                  widget.product?.description ?? "Error",
                  style: TextStyle(fontSize: 18.sp),
                  maxLines: 10,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${widget.product?.price ?? ""} \$",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Spacer(),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.w,
                        vertical: 15.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.black,
                      ),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
