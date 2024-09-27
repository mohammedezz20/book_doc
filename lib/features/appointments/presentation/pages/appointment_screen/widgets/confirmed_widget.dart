import 'package:book_doc/core/assets/vectors/vectors.dart';
import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/app_fonts.dart';

class ConfirmedWidget extends StatelessWidget {
  const ConfirmedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SvgPicture.asset(AppVector.confirmed),
        verticalSpace(21),
        Text(
          S.of(context).Booking_Confirmed,
          style: TextStyles.font15DarkBlueMedium.copyWith(fontSize: 20.sp),
        ),
      ],
    );
  }
}
