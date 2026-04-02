import 'package:book_stroe/core/helper/api_constants.dart';
import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/widgets/custom_slider.dart';
import 'package:book_stroe/features/home/ui/widgets/home_app_bar.dart';
import 'package:book_stroe/features/welcome/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is SliderLoadingState)
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        else if (state is SliderSuccessState) {
          return Column(
            crossAxisAlignment: .start,
            children: [
              HomeAppBar(),
              CustomSlider(sliders: state.sliders),
              SizedBox(height: 10.h),
              Row(
                children: [Text('Best seller', style: TextStyle(fontSize: 31))],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg',
                ),
              ),
            ],
          );
        } else {
          return Text('Error');
        }
      },
    );
  }
}
