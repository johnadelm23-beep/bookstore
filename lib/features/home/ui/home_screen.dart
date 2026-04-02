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
  void initState() {
    // TODO: implement initState
    super.initState();
    final homeCubit = context.read<HomeCubitCubit>();
    homeCubit.getSlider();
    homeCubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        HomeAppBar(),
        BlocBuilder<HomeCubitCubit, HomeCubitState>(
          builder: (context, state) {
            print('*****************************stateoOFTHESLIDER${state}');
            if (state is SliderLoadingState)
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            else if (state is SliderSuccessState) {
              return Expanded(child: CustomSlider(sliders: state.sliders));
            } else {
              return Text("Error");
            }
          },
        ),
        SizedBox(height: 10),
        Text("Best seller", style: TextStyle(fontSize: 25.sp)),
        BlocBuilder<HomeCubitCubit, HomeCubitState>(
          builder: (context, state) {
            if (state is ProductLoadingStatus)
              return Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            else if (state is ProductSuccessStatus) {
              return Expanded(
                child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              );
            } else {
              return Text("Error products");
            }
          },
        ),
      ],
    );
  }
}
