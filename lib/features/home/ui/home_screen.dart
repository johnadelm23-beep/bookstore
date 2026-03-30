import 'package:book_stroe/features/home/ui/widgets/custom_slider.dart';
import 'package:book_stroe/features/home/ui/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HomeAppBar(), CustomSlider()]);
  }
}
