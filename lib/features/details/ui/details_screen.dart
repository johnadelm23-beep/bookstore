import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/custom_network_image.dart';
import 'package:book_stroe/features/bookmark/cubit/cubit/bookmark_cubit.dart';
import 'package:book_stroe/features/bookmark/cubit/cubit/bookmark_state.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_cubit.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_state.dart';
import 'package:book_stroe/features/details/ui/widget/app_bar_details_screen.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, this.product});
  final Product? product;

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

              BlocListener<BookmarkCubit, BookmarkState>(
                listener: (context, state) {
                  if (state is BookMarkActionSuccess &&
                      state.bookId == product?.id) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message.tr()),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }

                  if (state is BookMarkActionError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message.tr()),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: BlocBuilder<BookmarkCubit, BookmarkState>(
                  builder: (context, state) {
                    final isFav =
                        product != null &&
                        context.read<BookmarkCubit>().isFavorite(product!.id);
                    return AppBarDetailsScreen(
                      isBookMark: isFav,
                      onTap: () {
                        if (product == null) return;
                        context.read<BookmarkCubit>().toggleFavorite(product!);
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 10.h),

              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CustomNetworkImage(
                    imageUrl: product?.image ?? "",
                    width: 183.w,
                    hight: 271.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                product?.name ?? LocaleKeys.noName.tr(),
                style: TextStyle(fontSize: 20.sp),
              ),

              SizedBox(height: 10.h),

              Text(
                product?.category ?? LocaleKeys.noCategory.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(height: 15.h),

              Expanded(
                child: Text(
                  product?.description ?? LocaleKeys.noDescription.tr(),
                  style: TextStyle(fontSize: 18.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),

              BlocListener<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is CartSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(LocaleKeys.cartAddSuccess.tr()),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }

                  if (state is CartError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(LocaleKeys.cartAddFailed.tr()),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.priceProduct.tr(
                        namedArgs: {'price': product?.price ?? ""},
                      ),
                      style: TextStyle(fontSize: 20.sp),
                    ),

                    const Spacer(),

                    InkWell(
                      onTap: () {
                        if (product == null) return;

                        context.read<CartCubit>().addToCart(product!.id);
                      },
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
                          LocaleKeys.addToCart.tr(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
