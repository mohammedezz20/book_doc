import 'package:book_doc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.categoryName, required this.categoryImage});

  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.r,
          child: Image.asset(
            categoryImage,
            width: 40.w,
            height: 40.h,
          ),
        ),
        verticalSpace(7),
        Text(
          categoryName,
          style: TextStyles.font12DarkBlueRegular,
        ),
      ],
    );
  }
}
