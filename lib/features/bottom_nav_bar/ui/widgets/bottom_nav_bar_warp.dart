import 'package:book_stroe/features/bookmark/cubit/cubit/bookmark_cubit.dart';
import 'package:book_stroe/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_cubit.dart';
import 'package:book_stroe/features/home/cubit/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarWrapper extends StatelessWidget {
  const BottomNavBarWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubitCubit()..getHomeData()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => BookmarkCubit()..showBookmark()),
        //BlocProvider(create: (_) => BookmarkCubit()),
      ],
      child: const BottomNavBarScreen(),
    );
  }
}
