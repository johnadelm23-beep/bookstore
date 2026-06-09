import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_container_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Center(
                child: Text(
                  'WishList',
                  style: TextStyle(fontSize: 35.sp, fontWeight: .bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          BlocBuilder<HomeCubitCubit, HomeCubitState>(
            builder: (context, state) {
              if (state is ShowBookMarkLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ShowBookMarkSuccessState) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.wishList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 162 / 281,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.wishList[index];
                    return CustomContainerProducts(products: product);
                  },
                );
              } else if (state is ShowBookMarkErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [Lottie.asset('assets/lottie/Empty box.json')],
                  ),
                );
              } else {
                return Text("Error actullay");
              }
            },
          ),
        ],
      ),
    );
  }
}
