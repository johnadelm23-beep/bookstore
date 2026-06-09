import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_cubit.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_state.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_container_products.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_slider.dart';
import 'package:book_stroe/features/home/ui/widgets/home_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to cart successfully ✅"),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is CartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Failed to add to cart ❌"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        body: BlocBuilder<HomeCubitCubit, HomeCubitState>(
          builder: (context, state) {
            return Column(
              children: [
                HomeAppBar(),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔵 SLIDER SECTION
                          SizedBox(height: 180.h, child: _buildSlider(state)),

                          SizedBox(height: 10.h),

                          // 🟡 TITLE
                          Text(
                            "Best Seller Books",
                            style: TextStyle(fontSize: 22.sp),
                          ),

                          SizedBox(height: 10.h),

                          // 🟢 PRODUCTS GRID
                          _buildProducts(state),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ---------------- SLIDER ----------------
  Widget _buildSlider(HomeCubitState state) {
    if (state is HomeLoadingState) {
      return Skeletonizer(
        enabled: true,
        child: Container(
          height: 180.h,
          width: double.infinity,
          color: Colors.grey.shade300,
        ),
      );
    }

    if (state is HomeSuccessState) {
      return CustomSlider(sliders: state.sliders);
    }

    return const SizedBox();
  }

  // ---------------- PRODUCTS ----------------
  Widget _buildProducts(HomeCubitState state) {
    if (state is HomeLoadingState) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 162 / 281,
        ),
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: true,
            child: CustomContainerProducts(products: null),
          );
        },
      );
    }

    if (state is HomeSuccessState) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 162 / 281,
        ),
        itemBuilder: (context, index) {
          return CustomContainerProducts(products: state.products[index]);
        },
      );
    }

    if (state is HomeErrorState) {
      return const Center(
        child: Text(
          "Something went wrong",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return const SizedBox();
  }
}
