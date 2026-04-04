import 'package:book_stroe/core/widgets/custom_translation_button.dart';
import 'package:book_stroe/features/welcome/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
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
          width: 100.w,
          height: 100.h,
        ),
        Spacer(),
        SvgPicture.asset('assets/icons/search-normal.svg'),

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
