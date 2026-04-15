import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_container_products.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_slider.dart';
import 'package:book_stroe/features/home/ui/widgets/home_app_bar.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubitCubit, HomeCubitState>(
        builder: (context, state) {
          return Column(
            children: [
              HomeAppBar(),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 180.h,
                          child: state is HomeLoadingState
                              ? Skeletonizer(
                                  enabled: true,
                                  child: Container(
                                    width: double.infinity,
                                    height: 180.h,
                                    color: Colors.grey.shade300,
                                  ),
                                )
                              : (state is HomeSuccessState
                                    ? CustomSlider(sliders: state.sliders)
                                    : SizedBox()),
                        ),

                        SizedBox(height: 10),

                        Text(
                          LocaleKeys.booksTitleBestSeller,
                          style: TextStyle(fontSize: 25.sp),
                        ).tr(),

                        SizedBox(height: 10),

                        if (state is HomeLoadingState)
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 162 / 281,
                                ),
                            itemBuilder: (context, index) {
                              return Skeletonizer(
                                enabled: true,
                                child: CustomContainerProducts(
                                  products: null,
                                  backGroundColor: Colors.grey.shade300,
                                ),
                              );
                            },
                          )
                        else if (state is HomeSuccessState)
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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
                              return CustomContainerProducts(
                                products: product,
                                onPressed: () {},
                              );
                            },
                          )
                        else
                          Center(child: Text(LocaleKeys.errorLabel).tr()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
