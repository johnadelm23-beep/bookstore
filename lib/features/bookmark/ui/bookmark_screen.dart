import 'package:book_stroe/features/bookmark/cubit/cubit/bookmark_cubit.dart';
import 'package:book_stroe/features/bookmark/cubit/cubit/bookmark_state.dart';
import 'package:book_stroe/features/home/data/model/product_model.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_container_products.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<BookmarkCubit>();
    if (cubit.wishlist.isEmpty) {
      cubit.showBookmark();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10.h),

          /// ================= TITLE =================
          Text(
            LocaleKeys.wishlist.tr(),
            style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10.h),

          /// ================= BODY =================
          Expanded(
            child: BlocBuilder<BookmarkCubit, BookmarkState>(
              buildWhen: (previous, current) {
                return current is GetBookMarkSuccess ||
                    current is BookMarkLoading ||
                    current is BookMarkError;
              },
              builder: (context, state) {
                if (state is BookMarkLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is GetBookMarkSuccess) {
                  final List<Product> list = state.bookmark.data.products;

                  if (list.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/lottie/Empty box.json',
                            height: 200.h,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            LocaleKeys.emptyWishlist.tr(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: EdgeInsets.all(10.w),
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 162 / 281,
                        ),
                    itemBuilder: (context, index) {
                      final product = list[index];

                      return CustomContainerProducts(products: product);
                    },
                  );
                }

                if (state is BookMarkError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/Empty box.json',
                          height: 200.h,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  );
                }

                // Fallback to currently held wishlist
                final currentWishlist = context.read<BookmarkCubit>().wishlist;
                if (currentWishlist.isNotEmpty) {
                  return GridView.builder(
                    padding: EdgeInsets.all(10.w),
                    itemCount: currentWishlist.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 162 / 281,
                        ),
                    itemBuilder: (context, index) {
                      final product = currentWishlist[index];

                      return CustomContainerProducts(products: product);
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
