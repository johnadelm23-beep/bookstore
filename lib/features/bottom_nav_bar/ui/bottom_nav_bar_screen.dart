import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/features/bookmark/ui/bookmark_screen.dart';

import 'package:book_stroe/features/cart/ui/cart_screen.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/home/ui/home_screen.dart';
import 'package:book_stroe/features/profile/ui/profile_screen.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int activeIndex = 0;

  final List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubitCubit()..getHomeData(),
      child: HomeScreen(),
    ),
    BookmarkScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: screens[activeIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,

        showSelectedLabels: true,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/HomeIcom.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                activeIndex == 0 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.Home.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/BookMark.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                activeIndex == 1
                    ? const Color.fromARGB(255, 113, 105, 84)
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.BookMark.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/CartIcon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                activeIndex == 2 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.Cart.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Profile.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                activeIndex == 3 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.Profile.tr(),
          ),
        ],
      ),
    );
  }
}
