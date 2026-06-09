import 'package:book_stroe/core/widgets/app_button.dart';
import 'package:book_stroe/core/widgets/custom_app_bar.dart';
import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/features/profile/cubit/cubit/profile_cubit.dart';
import 'package:book_stroe/features/profile/cubit/cubit/profile_state.dart';
import 'package:book_stroe/features/profile/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class EdittProfileScreen extends StatefulWidget {
  const EdittProfileScreen({super.key, required this.user});
  final UserData user;
  @override
  State<EdittProfileScreen> createState() => _EdittProfileScreenState();
}

class _EdittProfileScreenState extends State<EdittProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field is required";
    }
    return null;
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updateProfile(
        _nameController.text,
        _phoneController.text,
        _cityController.text,
        _addressController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }

        if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Update failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const CustomAppBar(
                    isCenterTitle: true,
                    title: "Edit Profile",
                  ),

                  SizedBox(height: 30.h),

                  CircleAvatar(
                    radius: 55.r,

                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100.r),
                      child: Image.network(widget.user.image),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  CustomTextFormField(
                    hintText: "Full Name",
                    controller: _nameController,
                    validator: _validate,
                  ),

                  SizedBox(height: 20.h),

                  CustomTextFormField(
                    hintText: "Phone Number",
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: _validate,
                  ),

                  SizedBox(height: 20.h),

                  CustomTextFormField(
                    hintText: "Address",
                    controller: _addressController,
                    validator: _validate,
                  ),

                  SizedBox(height: 20.h),

                  CustomTextFormField(
                    hintText: "City",
                    controller: _cityController,
                    validator: _validate,
                  ),

                  SizedBox(height: 40.h),

                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final isLoading = state is ProfileLoading;

                      return AppButton(
                        text: isLoading ? "Loading..." : "Update Profile",
                        onTap: isLoading ? null : _updateProfile,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
