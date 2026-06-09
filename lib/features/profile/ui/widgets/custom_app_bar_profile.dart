import 'package:book_stroe/features/welcome/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 30.sp, fontWeight: .bold),
            ),
          ),
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
          icon: Icon(IconlyLight.logout),
        ),
      ],
    );
  }
}
