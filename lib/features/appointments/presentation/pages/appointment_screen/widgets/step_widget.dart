import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepWidget extends StatelessWidget {
  StepWidget(
      {super.key, required this.number, this.color, required this.stepName});

  final String number;
  Color? color;
  final String stepName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: color ?? ColorsManager.mainBlue,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: TextStyles.font12GrayMedium.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          stepName,
          style: TextStyles.font12DarkBlueRegular,
        ),
      ],
    );
  }
}
