import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_cubit.dart';
import 'package:book_stroe/features/cart/cubit/cubit/cubit/cart_state.dart';
import 'package:book_stroe/features/cart/ui/widgets/custom_container_change.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            Text(
              "My Cart",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 25.h),

            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CartError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is CartSuccess) {
                    final cartItems = state.cart.data.cartItems;

                    if (cartItems.isEmpty) {
                      return Center(
                        child: Lottie.asset("assets/lottie/Empty box.json"),
                      );
                    }

                    return ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 15.h),
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                item.productImage,
                                width: 80.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(width: 10.w),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.productName,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            context
                                                .read<CartCubit>()
                                                .removeFromCart(item.itemId);
                                          },
                                          icon: Icon(
                                            IconlyLight.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 5.h),

                                    Text(
                                      "${item.productPriceAfterDiscount} \$",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    SizedBox(height: 10.h),

                                    Row(
                                      children: [
                                        CustomContainerChange(
                                          icon: Icons.remove,
                                          onTap: () {
                                            context
                                                .read<CartCubit>()
                                                .decreaseQty(
                                                  item.itemId,
                                                  item.quantity,
                                                );
                                          },
                                        ),
                                        SizedBox(width: 10.w),

                                        Text(
                                          item.quantity.toString(),
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                        SizedBox(width: 10.w),
                                        CustomContainerChange(
                                          icon: Icons.add,
                                          onTap: () {
                                            context
                                                .read<CartCubit>()
                                                .increaseQty(
                                                  item.itemId,
                                                  item.quantity,
                                                );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),

            /// TOTAL + CHECKOUT
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartSuccess) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total:", style: TextStyle(fontSize: 20.sp)),
                          Text(
                            "${state.cart.data.total} EGP",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      AppButton(text: "Checkout", onTap: () {}),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
