import 'package:book_doc/generated/l10n.dart';
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
          S.of(context).Fill_Your_Profile,
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(6),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S
                    .of(context)
                    .Please_take_a_few_minutes_to_fill_out_your_profile_with_as_much_detail_as_possible,
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
