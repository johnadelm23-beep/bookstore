import 'package:book_stroe/core/theme/app_colors.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/features/order/cubit/cubit/order_cubit.dart';
import 'package:book_stroe/features/order/cubit/cubit/order_state.dart';
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
      context.read<OrderCubit>().getOrders();
    });
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "new":
        return Colors.blue;
      case "pending":
        return Colors.orange;
      case "shipping":
        return Colors.purple;
      case "completed":
        return Colors.green;
      default:
        return Colors.grey;
    }
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
              if (state is OrderLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }

              if (state is OrderError) {
                return const Center(child: Text("Something went wrong"));
              }

              if (state is OrderSuccess) {
                final orders = state.orders;

                if (orders.isEmpty) {
                  return const Center(child: Text("No orders yet"));
                }

                return Column(
                  children: [
                    const CustomAppBar(isCenterTitle: true, title: "My Orders"),

                    SizedBox(height: 20.h),

                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: orders.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final order = orders[index];

                          return Container(
                            padding: EdgeInsets.only(
                              top: 16.h,
                              left: 10.w,
                              right: 10.w,
                              bottom: 50.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// TOP ROW
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order No ${order.orderCode}",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      order.orderDate,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12.h),

                                /// STATUS + TOTAL
                                Divider(color: Colors.grey.shade300),
                                Row(
                                  mainAxisAlignment: .end,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Total amount: ",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "\$ ${order.total}",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                              fontWeight: .bold,
                                            ),
                                          ),
                                        ],
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
