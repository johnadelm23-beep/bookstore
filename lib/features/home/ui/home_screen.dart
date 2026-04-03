import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_container_products.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_slider.dart';
import 'package:book_stroe/features/home/ui/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),

        Expanded(
          child: BlocBuilder<HomeCubitCubit, HomeCubitState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (state is HomeSuccessState) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Slider
                      SizedBox(
                        height: 180.h,
                        child: CustomSlider(sliders: state.sliders),
                      ),

                      SizedBox(height: 10),

                      // 🔹 Title
                      Text("Best seller", style: TextStyle(fontSize: 25.sp)),

                      SizedBox(height: 10),

                      // 🔹 Products
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 162 / 281,
                              ),
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return CustomContainerProducts(products: product);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Expanded(child: Center(child: Text("Error")));
              }
            },
          ),
        ),
      ],
    );
  }
}
