import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/place_order/ui/congrats_screen.dart';
import 'package:flutter/material.dart';
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
  final governorateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    governorateController.dispose();
    super.dispose();
  }

  void submitOrder() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => const CongratsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),

              SizedBox(height: 10.h),

              Text(
                "Place Your Order",
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5.h),

              Text(
                "Please fill your details to complete the order.",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),

              SizedBox(height: 20.h),

              Expanded(
                child: Form(
                  key: formKey, // ✅ FIXED
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: "Full name",
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 12.h),

                        CustomTextFormField(
                          hintText: "Address",
                          controller: addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Address is required";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 12.h),

                        CustomTextFormField(
                          hintText: "Phone",
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone is required";
                            }
                            if (value.length < 11) {
                              return "Phone must be 11 digits";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 12.h),

                        CustomTextFormField(
                          hintText: "Governorate",
                          controller: governorateController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Governorate is required";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.total} EGP",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              AppButton(text: "Submit Order", onTap: submitOrder),
            ],
          ),
        ),
      ),
    );
  }
}
