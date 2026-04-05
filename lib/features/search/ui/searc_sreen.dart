import 'package:book_stroe/core/widgets/custom_text_form_field.dart';
import 'package:book_stroe/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSreen extends StatelessWidget {
  const SearchSreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              CustomTextFormField(
                hintText: LocaleKeys.searchHint.tr(),
                isPassword: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
