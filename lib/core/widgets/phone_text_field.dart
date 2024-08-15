import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_text_field/phone_text_field.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CustomPhoneTextField extends StatelessWidget {
  CustomPhoneTextField({super.key, required this.onChanged});

  void Function(PhoneNumber)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PhoneTextField(
      locale: const Locale('en'),
      decoration: InputDecoration(
        filled: true,
        hintText: 'WhatsApp Number',
        hintStyle: TextStyles.font14LightGrayRegular,
        fillColor: ColorsManager.moreLightGray,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
      ),
      textAlign: TextAlign.start,
      searchFieldInputDecoration: InputDecoration(
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        suffixIcon: const Icon(Icons.search),
        hintText: "Search country",
        hintStyle: TextStyles.font14LightGrayRegular,
        fillColor: ColorsManager.moreLightGray,
      ),
      initialCountryCode: "EG",
      onChanged: onChanged,
    );
  }
}
