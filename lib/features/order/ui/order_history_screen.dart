import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/features/order/cubit/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OrderCubit>().getOrderHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8F9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is OrderHistoryLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }

              if (state is OrderHistoryError) {
                return Center(child: Text("Empty"));
              }

              if (state is OrderHistorySuccess) {
                return Column(
                  children: [
                    const CustomAppBar(isCenterTitle: true, title: "My Orders"),

                    SizedBox(height: 20.h),

                    Expanded(
                      child: ListView.builder(
                        itemCount: state.order.length,
                        itemBuilder: (context, index) {
                          final order = state.order[index];

                          return Container(
                            margin: EdgeInsets.only(bottom: 12.h),
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              color: const Color(0xffE8ECF4),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Order #${order.orderCode}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      order.orderDate,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),

                                const Divider(),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      order.status,
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),

                                    Text(
                                      "${order.total} EGP",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
