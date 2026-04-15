import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:book_stroe/features/search/cubit/cubit/search_cubit.dart';
import 'package:book_stroe/features/search/data/search_repo.dart';
import 'package:book_stroe/features/search/ui/search_screen.dart';
import 'package:book_stroe/features/welcome/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/splash/bookialogo.png',
          width: 80.w,
          height: 80.h,
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => BlocProvider(
                  create: (context) => SearchCubit(SearchRepo()),
                  child: SearchScreen(),
                ),
              ),
            );
          },
          child: SvgPicture.asset('assets/icons/search-normal.svg'),
        ),

        IconButton(
          onPressed: () async {
            var prefs = await SharedPreferences.getInstance();
            await prefs.remove('token');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => WelcomeScreen()),
            );
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }
}
