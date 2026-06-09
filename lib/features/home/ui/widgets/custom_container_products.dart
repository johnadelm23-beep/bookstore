import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/custom_network_image.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_cubit.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/details/ui/details_screen.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerProducts extends StatelessWidget {
  const CustomContainerProducts({super.key, required this.products});

  final Product? products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailsScreen(product: products)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 162.w,
        height: 281.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.backGroundContainerItem,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomNetworkImage(
                imageUrl: products?.image ?? "",
                width: 140.w,
                hight: 175.h,
              ),
            ),

            SizedBox(height: 8),

            Text(
              products?.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(child: Text("${products?.price ?? ""} \$")),

                InkWell(
                  onTap: () {
                    context.read<CartCubit>().addToCart(products!.id);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      LocaleKeys.Buy.tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
