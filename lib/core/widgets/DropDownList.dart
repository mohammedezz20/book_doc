import 'package:book_doc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownList extends StatelessWidget {
  DropDownList({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  void Function(String?)? onChanged;
  final String? value;
  List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.moreLightGray,
          border: Border.all(color: ColorsManager.lighterGray, width: 1.3.w),
          borderRadius: BorderRadius.circular(16.r)),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
        underline: Container(),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
