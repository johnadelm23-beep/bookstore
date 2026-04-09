import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/custom_network_image.dart';
import 'package:book_stroe/features/details/ui/details_screen.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerProducts extends StatelessWidget {
  const CustomContainerProducts({
    super.key,
    required this.products,
    this.backGroundColor,
    this.onPressed,
  });
  final Product? products;
  final Color? backGroundColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => BlocProvider(
              create: (context) => HomeCubitCubit(),
              child: DetailsScreen(product: products),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 11.96.h, left: 10.96.w, right: 10.96.w),
        width: 162.w,
        height: 281.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: backGroundColor ?? AppColors.backGroundContainerItem,
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 10.h),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12.r),
                child: CustomNetworkImage(
                  imageUrl: products?.image ?? "",
                  width: 140.w,
                  hight: 175.28.h,
                ),
                /*
                   width: 140.w,
                  height: 175.28.h, */
              ),
              Expanded(
                child: Text(
                  products?.name ?? "Test Test",
                  style: TextStyle(fontSize: 18.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Expanded(child: Text("${products?.price ?? ""} \$")),

                  BlocListener<HomeCubitCubit, HomeCubitState>(
                    listener: (context, state) {
                      if (state is AddToCartLoadingState) {
                        showDialog(
                          context: context,
                          builder: (c) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        );
                      } else if (state is AddToCartSuccessState) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added to cart successfully')),
                        );
                      } else if (state is AddToCartLoadingState) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Failed')));
                      }
                      // TODO: implement listener
                    },
                    child: InkWell(
                      onTap: () {
                        context.read<HomeCubitCubit>().addToCart(
                          products?.id ?? 0,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.w,
                          horizontal: 15.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.Buy,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
