import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/profile/cubit/cubit/profile_cubit.dart';
import 'package:book_stroe/features/profile/cubit/cubit/profile_state.dart';
import 'package:book_stroe/features/profile/ui/editt_profile_screen.dart';
import 'package:book_stroe/features/profile/ui/widgets/custom_app_bar_profile.dart';
import 'package:book_stroe/features/profile/ui/widgets/custom_header.dart';
import 'package:book_stroe/features/profile/ui/widgets/custom_item_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProfileCubit>().showProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (state is ProfileSuccess) {
            final user = state.user;

            return SingleChildScrollView(
              child: Column(
                spacing: 5.h,
                children: [
                  const CustomAppBarProfile(title: 'Profile'),

                  SizedBox(height: 20.h),

                  CustomHeader(user: user),

                  SizedBox(height: 20.h),

                  const CustomItemListContainer(title: "My Orders"),

                  SizedBox(height: 12.h),

                  CustomItemListContainer(
                    title: "Edit profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<ProfileCubit>(),
                            child: EdittProfileScreen(user: user),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 12.h),

                  const CustomItemListContainer(title: "Reset password"),

                  SizedBox(height: 12.h),

                  const CustomItemListContainer(title: "FAQ"),

                  SizedBox(height: 12.h),

                  const CustomItemListContainer(title: "Contact us"),

                  SizedBox(height: 12.h),

                  const CustomItemListContainer(title: "Privacy & terms"),
                ],
              ),
            );
          }

          if (state is ProfileError) {
            return const Center(child: Text("Failed to load profile"));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
