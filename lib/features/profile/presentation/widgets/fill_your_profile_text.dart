import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';

class FillYourProfileText extends StatelessWidget {
  const FillYourProfileText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fill Your Profile',
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(6),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Please take a few minutes to fill out your profile with as much detail as possible.',
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
