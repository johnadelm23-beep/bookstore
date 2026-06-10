import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/cart/cubit/cubit/checkout_cubit.dart';
import 'package:book_stroe/features/cart/cubit/cubit/checkout_state.dart';
import 'package:book_stroe/features/cart/data/model/govern_model.dart';
import 'package:book_stroe/features/place_order/ui/congrats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key, required this.total});
  final String total;

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final governorateController = TextEditingController();

  GovernorateModel? selectedGovernorate;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    governorateController.dispose();
    super.dispose();
  }

  void submitOrder() {
    if (!formKey.currentState!.validate()) return;
    if (selectedGovernorate == null) return;

    context.read<CheckoutCubit>().placeOrder(
      name: nameController.text,
      address: addressController.text,
      phone: phoneController.text,
      email: emailController.text,
      governorateId: selectedGovernorate!.id.toString(),
    );
  }

  void openGovernorates() {
    context.read<CheckoutCubit>().getGovernorates();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(height: 15.h),

              Text(
                "Select Governorate",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10.h),

              Expanded(
                child: BlocBuilder<CheckoutCubit, CheckoutState>(
                  builder: (context, state) {
                    if (state is GovernorateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is GovernorateSuccess) {
                      return ListView.separated(
                        itemCount: state.data.length,
                        separatorBuilder: (_, __) => Divider(height: 1),
                        itemBuilder: (context, index) {
                          final gov = state.data[index];

                          return ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            leading: CircleAvatar(
                              radius: 18.r,
                              child: Text(gov.nameEn[0]),
                            ),
                            title: Text(
                              gov.nameEn,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            onTap: () {
                              setState(() {
                                selectedGovernorate = gov;
                                governorateController.text = gov.nameEn;
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const CongratsScreen()),
          );
        }

        if (state is PlaceOrderError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffF6F7FB),

          body: SafeArea(
            child: Column(
              children: [
                const CustomAppBar(),

                SizedBox(height: 10.h),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          /// HEADER CARD
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Place Your Order",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Fill your details below",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 15.h),

                          /// FORM CARD
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    hintText: "Full name",
                                    controller: nameController,
                                  ),

                                  SizedBox(height: 10.h),

                                  CustomTextFormField(
                                    hintText: "Address",
                                    controller: addressController,
                                  ),

                                  SizedBox(height: 10.h),

                                  CustomTextFormField(
                                    hintText: "Phone",
                                    controller: phoneController,
                                  ),

                                  SizedBox(height: 10.h),

                                  CustomTextFormField(
                                    hintText: "Email",
                                    controller: emailController,
                                  ),

                                  SizedBox(height: 10.h),

                                  /// GOVERNORATE FIELD (MODERN UI)
                                  GestureDetector(
                                    onTap: openGovernorates,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 16.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              selectedGovernorate?.nameEn ??
                                                  "Select Governorate",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color:
                                                    selectedGovernorate == null
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// BOTTOM BUTTON
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: AppButton(
                    text: state is PlaceOrderLoading
                        ? "Loading..."
                        : "Submit Order",
                    isLoading: state is PlaceOrderLoading,
                    onTap: submitOrder,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
